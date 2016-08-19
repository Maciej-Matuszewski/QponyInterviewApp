//
//  ResponseModel.swift
//  QponyInterviewApp
//
//  Created by Maciej Matuszewski on 19.08.2016.
//  Copyright © 2016 Maciej Matuszewski. All rights reserved.
//

import ObjectMapper

class ResponseModel: Mappable{
	
    var city: CityModel?
    var days: [DayResultModel]?
    
	// MARK: - Init
	required init?(_ map: Map) {
	}
	
	func mapping(map: Map) {
        city <- map["city"]
        days <- map["list"]
	}
}