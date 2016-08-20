//
//  Extensions.swift
//  QponyInterviewApp
//
//  Created by Maciej Matuszewski on 19.08.2016.
//  Copyright © 2016 Maciej Matuszewski. All rights reserved.
//

import Foundation
import UIKit

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}

extension NSDate {
    func timeFromDate(date: NSDate, component: NSCalendarUnit) -> Int {
        return NSCalendar.currentCalendar().components([.Year, .Month, .Day, .Hour, .Minute, .Second], fromDate: date, toDate: self, options: []).valueForComponent(component)
    }
    
    func dateWithoutTime() -> NSDate{
        let components = NSCalendar.currentCalendar().components([.Year, .Month, .Day,], fromDate: self)
        return NSCalendar.currentCalendar().dateFromComponents(components)!
    }
    
    func dateToString(format: String) -> String{
        let formatter = NSDateFormatter()
        let locale = NSLocale(localeIdentifier: "en_US_POSIX")
        
        formatter.locale = locale
        formatter.dateFormat = format
        
        return formatter.stringFromDate(self)
    }
    
    func dateName() -> String {
        if self.timeFromDate(NSDate().dateWithoutTime(), component: NSCalendarUnit.Hour) < 0 {
            return "Yesterday".localized
        }
        let days = self.timeFromDate(NSDate().dateWithoutTime(), component: NSCalendarUnit.Day)
        return days == 0 ? "Today".localized :
        days == 1 ? "Tomorrow".localized :
        self.dateToString("dd MMMM")
    }
}

extension UIColor {
    func isLight() -> Bool
    {
        if CGColorGetNumberOfComponents(self.CGColor) > 2{
            let components = CGColorGetComponents(self.CGColor)
            let brightness = (components[0] * 299 + components[1] * 587 + components[2] * 114)
            return brightness > 500
        }else{
            
            var white : CGFloat = 0
            self.getWhite(&white, alpha: nil)
            return white >= 0.5
        }
        
        
    }
}