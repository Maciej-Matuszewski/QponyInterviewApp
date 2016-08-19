//
//  Constans.swift
//  QponyInterviewApp
//
//  Created by Maciej Matuszewski on 19.08.2016.
//  Copyright © 2016 Maciej Matuszewski. All rights reserved.
//

import Foundation
import UIKit

struct Constants {
    
    //MARK:- Colors
    
    static let kColorMain = UIColor(red:0.09, green:1.00, blue:0.76, alpha:1.00)
    static let kColorBackground = UIColor(red:0.06, green:0.08, blue:0.14, alpha:1.00)
    static let kColorNavigation = UIColor(red:0.10, green:0.18, blue:0.19, alpha:1.00)
    static let kColorLightBackground = UIColor(red:0.14, green:0.27, blue:0.25, alpha:1.00)
    static let kColorDarkBackground = UIColor(red:0.11, green:0.18, blue:0.19, alpha:1.00)
    static let kColorLightFont = UIColor(red:0.42, green:0.98, blue:0.76, alpha:1.00)
    static let kColorWhite = UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.00)
    static let kColorGrey = UIColor(red:0.39, green:0.40, blue:0.41, alpha:1.00)
    static let kColorRed = UIColor.redColor()
    
    //MARK:- Fonts
    
    static let kFontHeader = UIFont.systemFontOfSize(UIFont.systemFontSize() + 6)
    static let kFontNormal = UIFont.systemFontOfSize(UIFont.systemFontSize())
    static let kFontSmall = UIFont.systemFontOfSize(UIFont.smallSystemFontSize())
    
    //MARK:- URLs
    static let kOpenWeatherMapURL = "http://api.openweathermap.org/data/2.5/"
    
    //MARK:- Keys
    static let kOpenWeatherMapAppID = "ad4e521f54b155390c178acc59582f10"
}

//MARK: - Device recognize

struct ScreenSize
{
    static let SCREEN_WIDTH = UIScreen.mainScreen().bounds.size.width
    static let SCREEN_HEIGHT = UIScreen.mainScreen().bounds.size.height
    static let SCREEN_MAX_LENGTH = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    static let SCREEN_MIN_LENGTH = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
}

struct DeviceType
{
    static let IS_IPHONE_4_OR_LESS =  UIDevice.currentDevice().userInterfaceIdiom == .Phone && ScreenSize.SCREEN_MAX_LENGTH < 568.0
    static let IS_IPHONE_5 = UIDevice.currentDevice().userInterfaceIdiom == .Phone && ScreenSize.SCREEN_MAX_LENGTH == 568.0
    static let IS_IPHONE_6 = UIDevice.currentDevice().userInterfaceIdiom == .Phone && ScreenSize.SCREEN_MAX_LENGTH == 667.0
    static let IS_IPHONE_6P = UIDevice.currentDevice().userInterfaceIdiom == .Phone && ScreenSize.SCREEN_MAX_LENGTH == 736.0
}

enum Units: String{
    case metric
    case imperial
}