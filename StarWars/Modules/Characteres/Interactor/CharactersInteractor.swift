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
        
        Alamofire.request(Constants.Api.peopleURL, method: .get)
            .validate()
            .responseObject { (response: DataResponse<Characters>) in
                if response.result.isSuccess {
                    Observable.just(response.result.value?.results)
                        .observeOn(MainScheduler.instance)
                        .map { characters -> Array<[String: String]> in
                            
                            var charactersArray = Array<[String: String]>()
                            for character in characters! {
                                charactersArray.append([
                                    "name": character.name ?? "",
                                    "height": character.height ?? "",
                                    "mass": character.mass ?? "",
                                    "gender": character.gender ?? "",
                                    "homeworld": character.homeworld ?? ""
                                    ])
                            }
                            
                            return charactersArray
                        }
                        .subscribe(
                            onNext: { charactersArray in
                                self.charactersArray.append(contentsOf: charactersArray)
                            },
                            onError: { error in
                                self.output.didFailToFetchCharacters()
                            },
                            onCompleted: {
                                self.output.didFetchCharactersWithSuccess(self.charactersArray)
                            },
                            onDisposed: nil)
                        .addDisposableTo(disposeBag)
                    
                } else {
                    self.output.didFailToFetchCharacters()
                }
            }
    }
}
