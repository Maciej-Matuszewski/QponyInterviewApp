//
//  TemperatureModel.swift
//  QponyInterviewApp
//
//  Created by Maciej Matuszewski on 19.08.2016.
//  Copyright © 2016 Maciej Matuszewski. All rights reserved.
//

import ObjectMapper

class TemperatureModel: Mappable{
    
    var day: Float?
    var min: Float?
    var max: Float?
    var night: Float?
    var eve: Float?
    var morn: Float?
    
    
    // MARK: - Init
    required init?(_ map: Map) {
    }
    
    func mapping(map: Map) {
        day <- map["day"]
        min <- map["min"]
        max <- map["max"]
        night <- map["night"]
        eve <- map["eve"]
        morn <- map["morn"]
    }
}