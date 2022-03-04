//
//  ErrorModel.swift
//  LastFM
//
//  Created by wafaa farrag on 03/03/2022.
//

import Mapper

struct ErrorModel: Mappable {
    
    let code: String
    let message: String
    
    init(map: Mapper) throws {
        try code = map.from("code")
        try message = map.from("message")
    }
    
}
