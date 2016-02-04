//
//  Entry.swift
//  Journal
//
//  Created by Daniel Dickson on 2/4/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class Entry: Equatable {
    let timestamp: String = "At one point in time..."
    let title: String
    let bodyText: String
    
    init(title: String, bodyText: String) {
        self.title = title
        self.bodyText = bodyText
    }
}

func ==(lhs: Entry, rhs: Entry) -> Bool {
    return (lhs.timestamp == rhs.timestamp) && (lhs.title == rhs.title) && (lhs.bodyText == rhs.bodyText)
}