//
//  DayResultModel.swift
//  QponyInterviewApp
//
//  Created by Maciej Matuszewski on 19.08.2016.
//  Copyright © 2016 Maciej Matuszewski. All rights reserved.
//

import ObjectMapper

class DayResultModel: Mappable{
    
    var dt: Double?
    var temperature: TemperatureModel?
    var pressure: Float?
    var weather: [WeatherModel]?
    
    // MARK: - Init
    required init?(_ map: Map) {
    }
    
    func mapping(map: Map) {
        dt <- map["dt"]
        temperature <- map["temp"]
        pressure <- map["pressure"]
        weather <- map["weather"]
    }
}