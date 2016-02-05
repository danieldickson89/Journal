//
//  Entry.swift
//  Journal
//
//  Created by Daniel Dickson on 2/4/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class Entry: Equatable {
    let timestamp = NSDate()
    let title: String
    let bodyText: String
    
    var entry: Entry?
    
    init(title: String, bodyText: String) {
        self.title = title
        self.bodyText = bodyText
    }
}

func ==(lhs: Entry, rhs: Entry) -> Bool {
    return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
}