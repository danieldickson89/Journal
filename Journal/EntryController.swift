//
//  EntryController.swift
//  Journal
//
//  Created by Daniel Dickson on 2/4/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import CoreData

class EntryController {

    private let entryKey = "entryKey"
    
    static let sharedInstance = EntryController()
    
    var entriesArray: [Entry] {
        let request = NSFetchRequest(entityName: "Entry")
        
        let moc = Stack.sharedStack.managedObjectContext
        
        do {
            return (try moc.executeFetchRequest(request) as! [Entry]).sort({$0.title < $1.title
                //(entry1, entry2) -> Bool in
                //return entry1.timestamp.compare(entry2.timestamp) == NSComparisonResult.OrderedDescending
            })
        } catch {
            return []
        }
    }
    
    func saveToPersistentStorage() {
        let moc = Stack.sharedStack.managedObjectContext
        do {
            try moc.save()
        } catch {
            print("Error saving Managed Object Context. Items not saved.")
        }
    }
    
    
    func addEntry(entry: Entry) {
        self.saveToPersistentStorage()
    }
    
    func removeEntry(entry: Entry) {
        
        entry.managedObjectContext?.deleteObject(entry)
        saveToPersistentStorage()
    }
}