//
//  CharactersInteractor.swift
//  StarWars
//
//  Created by Pedro Henrique Prates Peralta on 5/15/16.
//  Copyright © 2016 Pedro Henrique Peralta. All rights reserved.
//

import Foundation
import ObjectMapper
import Alamofire
import AlamofireObjectMapper
import RxSwift
import RxCocoa


class CharactersInteractor: CharactersUseCase {
    
    // MARK: Attributes
    
    weak var output: CharactersInteractorOutput!
    var charactersArray: [[String: String]] = []
    
    
    // MARK: CharactersUseCase
    
    func fetchCharacters() {
        let disposeBag = DisposeBag()
        
        Alamofire.request(.GET, Constants.Api.peopleURL).validate().responseObject { (response: Response<Characters, NSError>) in
            if response.result.isSuccess {
                response.result.value?.results?
                    .toObservable()
                    .observeOn(MainScheduler.instance)
                    .map { character -> [String: String] in
                        return [
                            "name": character.name!,
                            "height": character.height!,
                            "mass": character.mass!,
                            "gender": character.gender!,
                            "homeworld": character.homeworld!
                        ]
                    }
                    .subscribe(onNext: { characterDictionary in
                            self.charactersArray.append(characterDictionary)
                        }, onError: { error in
                            self.output.onCharactersFetchError()
                        }, onCompleted: {
                            self.output.onCharactersFetched()
                        }, onDisposed: nil)
                    .addDisposableTo(disposeBag)
                
            } else {
                self.output.onCharactersFetchError()
            }
        }
    }
}
