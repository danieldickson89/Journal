//
//  EntryController.swift
//  Journal
//
//  Created by Daniel Dickson on 2/4/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class EntryController {
    
    private let entryKey = "entryKey"
    
    static let sharedInstance = EntryController()
    
    var entriesArray: [Entry]
    
    init() {
        entriesArray = []
        self.loadFromPersistentStorage()
    }
    
    func loadFromPersistentStorage() {
        let entryDictionariesFromDefaults = NSUserDefaults.standardUserDefaults().objectForKey(entryKey) as? [[String: AnyObject]]
        
        if let entryDictionary = entryDictionariesFromDefaults {
            
            self.entriesArray = entryDictionary.map({Entry(dictionary: $0)!})
        }
    }
    
    func saveToPersistentStorage() {
        let entryDictionaries = self.entriesArray.map({ $0.journalDictionary()})
        NSUserDefaults.standardUserDefaults().setObject(entryDictionaries, forKey: entryKey)
    }
    
    
    func addEntry(entry: Entry) {
        entriesArray.append(entry)
        self.saveToPersistentStorage()
    }
    
    func removeEntry(indexPath: NSIndexPath) {
        entriesArray.removeAtIndex(indexPath.row)
    }
}