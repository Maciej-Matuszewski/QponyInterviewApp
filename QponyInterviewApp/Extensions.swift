//
//  Extensions.swift
//  QponyInterviewApp
//
//  Created by Maciej Matuszewski on 19.08.2016.
//  Copyright © 2016 Maciej Matuszewski. All rights reserved.
//

import Foundation

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