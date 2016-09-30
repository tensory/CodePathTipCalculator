//
//  Constants.swift
//  CPTipCalculator
//
//  Created by Ari Lacenski on 9/26/16.
//  Copyright © 2016 Ari Lacenski. All rights reserved.
//

struct Constants {
    static let presetTipPercentages: [Double] = [0.18, 0.2, 0.25]
    static let tenMinutes = 600 // seconds
    
    struct Settings {
        static let defaultTipPercentage: String = "DefaultTipPercentage"
        static let cachedValue: String = "cachedValue"
    }
}
