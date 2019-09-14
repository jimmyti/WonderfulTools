//
//  Database.swift
//  Wonderful Tools
//
//  Created by Jimmy Ti on 13/9/19.
//  Copyright © 2019 Jimmy Ti. All rights reserved.
//

import ScreenSaver

// MARK: Database
struct Database {
    
    // MARK: Key
    fileprivate enum Key {
        static let isSoundEnabled = "isSoundEnabled"
    }
    
    // MARK: Properties
    static var standard: ScreenSaverDefaults {
        guard let bundleIdentifier = Bundle(for: ScreenSaverManager.self).bundleIdentifier,
            let database = ScreenSaverDefaults(forModuleWithName: bundleIdentifier)
            else { fatalError("Failed to retrieve database") }
        
        database.register(defaults:
            [Key.isSoundEnabled: false]
        )
        
        return database
    }
}

// MARK: - ScreenSaverDefaults's Functions
extension ScreenSaverDefaults {
    
    var isSoundEnabled: Bool {
        return bool(forKey: Database.Key.isSoundEnabled)
    }
    
    func set(isSoundEnabled: Bool) {
        set(isSoundEnabled, for: Database.Key.isSoundEnabled)
    }
}

// MARK: - ScreenSaverDefaults's Private Functions
private extension ScreenSaverDefaults {
    
    func set(_ object: Any, for key: String) {
        set(object, forKey: key)
        synchronize()
    }
}

