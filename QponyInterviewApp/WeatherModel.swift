//
//  WeatherModel.swift
//  QponyInterviewApp
//
//  Created by Maciej Matuszewski on 19.08.2016.
//  Copyright © 2016 Maciej Matuszewski. All rights reserved.
//

import ObjectMapper

class WeatherModel: Mappable{
    
    var id: Int?
    var main: String?
    var description: String?
    var icon: String?
    
    
    // MARK: - Init
    required init?(_ map: Map) {
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        main <- map["main"]
        description <- map["description"]
        icon <- map["icon"]
    }
}