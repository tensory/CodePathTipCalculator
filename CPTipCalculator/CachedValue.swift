//
//  CachedValue.swift
//  CPTipCalculator
//
//  Created by Ari Lacenski on 9/30/16.
//  Copyright © 2016 Ari Lacenski. All rights reserved.
//

import Foundation

struct CachedValue {
    struct Keys {
        static let lastAmount: String = "lastAmount"
        static let lastUpdated: String = "lastUpdated"
    }
    
    static func set(lastAmount: Double) {
        let defaults = NSUserDefaults.standardUserDefaults()
        
        let cachedValues = [Keys.lastUpdated: NSDate(), Keys.lastAmount: lastAmount]
        defaults.setValue(cachedValues, forKey: Constants.Settings.cachedValue)
    }

    static func get() -> Double? {
        let defaults = NSUserDefaults.standardUserDefaults()
        let cachedValue = defaults.dictionaryForKey(Constants.Settings.cachedValue)
        
        return cachedValue?[Keys.lastAmount] as? Double
    }

    static func expire() {
        let defaults = NSUserDefaults.standardUserDefaults()
        
        if let cachedValues: NSDictionary = defaults.dictionaryForKey(Constants.Settings.cachedValue) {
            if let lastUpdated: NSDate = cachedValues.valueForKey(Keys.lastUpdated) as? NSDate {
                if (lastUpdated.timeIntervalSinceNow > Double(Constants.tenMinutes)) {
                    defaults.removeObjectForKey(Constants.Settings.cachedValue)
                }
            }
        }
    }
}
