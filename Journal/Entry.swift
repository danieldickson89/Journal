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
    
    var timeStamp: String
    let title: String
    let bodyText: String
    
    init(timeStamp: String, title: String, bodyText: String) {
        self.timeStamp = timeStamp
        self.title = title
        self.bodyText = bodyText
    }
    
    init?(dictionary: [String: AnyObject]) {
        guard let timeStamp = dictionary[timestampKey] as? String,
              let title = dictionary[titleKey] as? String,
              let bodyText = dictionary[bodyTextKey] as? String else {
                
                self.timeStamp = ""
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
            timestampKey: self.timeStamp,
            titleKey: self.title,
            bodyTextKey: self.bodyTextKey
        ]
        
        return dictionary
    }
    
}

func ==(lhs: Entry, rhs: Entry) -> Bool {
    return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
}