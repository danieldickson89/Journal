//
//  AppearanceController.swift
//  Journal
//
//  Created by Daniel Dickson on 2/9/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import UIKit

class AppearanceController {
    
    static func initializeAppearanceDefaults() {
        UINavigationBar.appearance().barTintColor = UIColor.myBlueColor()
        
        UINavigationBar.appearance().tintColor = UIColor.myGreenColor()
    }
    
}