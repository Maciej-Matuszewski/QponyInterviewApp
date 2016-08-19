//
//  CityModel.swift
//  QponyInterviewApp
//
//  Created by Maciej Matuszewski on 19.08.2016.
//  Copyright © 2016 Maciej Matuszewski. All rights reserved.
//

import ObjectMapper

class CityModel: Mappable{
    
    var id: Int?
    var name: String?
    
    // MARK: - Init
    required init?(_ map: Map) {
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
    }
}