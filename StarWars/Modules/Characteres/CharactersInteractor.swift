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


class CharactersInteractor: CharactersUseCase {
    
    // MARK: Attributes
    
    weak var output: CharactersInteractorOutput!
    
    
    // MARK: CharactersUseCase
    
    func fetchCharacters() {
        Alamofire.request(.GET, Api.peopleURL).responseObject { (response: Response<Characters, NSError>) in
            if response.result.isSuccess, let people = response.result.value {
                print(people)
                self.output.onCharactersFetched()
                
            } else {
                self.output.onCharactersFetchError()
            }
        }
    }
}
