//
//  Network.swift
//  QponyInterviewApp
//
//  Created by Maciej Matuszewski on 19.08.2016.
//  Copyright © 2016 Maciej Matuszewski. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

// Networking

enum Network: URLRequestConvertible{
    case ForecastDaily(city: String, units: Units, days: Int)
	
	// MARK: URLRequestConvertible
	internal var URLRequest: NSMutableURLRequest {
		guard let URL = NSURL(string: Constants.kOpenWeatherMapURL) else {
			assertionFailure()
			return NSMutableURLRequest()
		}
		
		let mutableURLRequest = NSMutableURLRequest(URL: URL.URLByAppendingPathComponent(path))
		mutableURLRequest.HTTPMethod = method.rawValue
		
		switch self{
            
        case .ForecastDaily(let city, let units, let days):
            return authenticate(
                mutableURLRequest,
                parameters: [
                    "q": city,
                    "units": units.rawValue,
                    "cnt": days
                ]
            )
		}
	}
	
	// MARK: Private
	private var method: Alamofire.Method {
		switch self{
		case .ForecastDaily:
			return .GET
		}
	}
	
	private var path: String {
		switch self {
        case .ForecastDaily:
            return "forecast/daily"
		}
	}
}

// MARK: - Authenticate
private func authenticate(mutableURLRequest: NSMutableURLRequest, parameters: [String: AnyObject]?) -> NSMutableURLRequest {
	var authenticatedParameters = parameters != nil ? parameters! : [:]
	authenticatedParameters["appid"] = Constants.kOpenWeatherMapAppID
    authenticatedParameters["mode"] = "json"
	return Alamofire.ParameterEncoding.URL.encode(mutableURLRequest, parameters: authenticatedParameters).0
}

extension NSMutableURLRequest {
	
	// MARK: - Request Wrappers
	func requestJSON(completion: ((AnyObject?, NSError?) -> Void)?) {
		Alamofire.request(self)
			.responseJSON {
				(response) in
				
				switch response.result {
				case .Success(let JSON): completion?(JSON, nil)
				case .Failure(let error): completion?(nil, error)
				}
		}
	}
	
	func responseArray<T:Mappable>(completion: ([T]?, NSError?) -> Void) {
		Alamofire.request(self)
			.responseArray {
				(response: Response<[T], NSError>) in
				completion(response.result.value, response.result.error)
		}
	}
	
	func responseObject<T:Mappable>(completion: (T?, NSError?) -> Void) {
		Alamofire.request(self).responseObject {
			(response: Response<T, NSError>) in
			completion(response.result.value, response.result.error)
		}
	}
}