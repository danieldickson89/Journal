//
//  Entry+CoreDataProperties.swift
//  Journal
//
//  Created by Daniel Dickson on 2/15/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Entry {

    @NSManaged var title: String
    @NSManaged var text: String?
    @NSManaged var timestamp: NSDate

}
