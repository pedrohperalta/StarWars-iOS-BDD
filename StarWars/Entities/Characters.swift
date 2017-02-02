//
// Created by Pedro Henrique Prates Peralta on 5/15/16.
// Copyright (c) 2016 Pedro Henrique Peralta. All rights reserved.
//

import Foundation
import ObjectMapper


class Characters: Mappable {

    var count: Int?
    var next: String?
    var previous: String?
    var results: [Character]?


    required init?(map: Map) {
    }

    func mapping(map: Map) {
        count       <- map["count"]
        next        <- map["next"]
        previous    <- map["previous"]
        results     <- map["results"]
    }
}
