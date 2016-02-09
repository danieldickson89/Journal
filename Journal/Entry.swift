//
//  Entry.swift
//  Journal
//
//  Created by Daniel Dickson on 2/4/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class Entry: Equatable {
    
    private var timestampKey = "timestamp"
    private let titleKey = "title"
    private let bodyTextKey = "bodyText"
    
    var timeStamp: NSDate
    let title: String
    let bodyText: String
    
    init(timeStamp: NSDate = NSDate(), title: String, bodyText: String) {
        self.timeStamp = timeStamp
        self.title = title
        self.bodyText = bodyText
    }
    
    init?(dictionary: [String: AnyObject]) {
        guard let stringTimeStamp = dictionary[timestampKey] as? String,
              let timeStamp = Entry.dateFromString(stringTimeStamp),
              let title = dictionary[titleKey] as? String,
              let bodyText = dictionary[bodyTextKey] as? String else {
                
                self.timeStamp = NSDate()
                self.title = ""
                self.bodyText = ""
                
                return nil
        }
        self.timeStamp = timeStamp
        self.title = title
        self.bodyText = bodyText
    }
    
    func journalDictionary() -> [String: AnyObject] {
        let dictionary: [String: AnyObject] = [
            timestampKey: Entry.stringFromDate(self.timeStamp),
            titleKey: self.title,
            bodyTextKey: self.bodyTextKey
        ]
        
        
        return dictionary
    }
    
    private static func stringFromDate(date: NSDate) -> String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = .MediumStyle
        return dateFormatter.stringFromDate(date)
    }
    
    private static func dateFromString(date: String) -> NSDate? {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = .MediumStyle
        return dateFormatter.dateFromString(date)
    }
    
}

func ==(lhs: Entry, rhs: Entry) -> Bool {
    return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
}