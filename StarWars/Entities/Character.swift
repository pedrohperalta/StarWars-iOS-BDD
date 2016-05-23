//
// Created by Pedro Henrique Prates Peralta on 5/15/16.
// Copyright (c) 2016 Pedro Henrique Peralta. All rights reserved.
//

import Foundation
import ObjectMapper


class Character: Mappable {

    var name: String?
    var height: String?
    var mass: String?
    var gender: String?
    var homeworld: String?


    required init?(_ map: Map) {
    }

    func mapping(map: Map) {
        name        <- map["name"]
        height      <- map["height"]
        mass        <- map["mass"]
        gender      <- map["gender"]
        homeworld   <- map["homeworld"]
    }
}
