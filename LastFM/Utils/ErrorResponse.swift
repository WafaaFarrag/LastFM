//
//  ErrorResponse.swift
//  LastFM
//
//  Created by wafaa farrag on 03/03/2022.
//

import Mapper

struct ErrorResponse: Mappable {
    
    let error: Bool
    let errors: [ErrorModel]
    
    init(map: Mapper) throws {
        try error = map.from("error")
        try errors = map.from("errors")
    }
    
}
