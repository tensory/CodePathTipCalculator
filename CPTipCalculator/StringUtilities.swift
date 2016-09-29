//
//  StringUtilities.swift
//  CPTipCalculator
//
//  Created by Ari Lacenski on 9/27/16.
//  Copyright © 2016 Ari Lacenski. All rights reserved.
//

import Foundation
class StringUtilities {
    static func getIntegerPercentage(input: Double) -> String {
        return "\(Int(input * 100))%"
    }
    
    static func getCurrencyValue(input: Double) -> String {
        let formatter = NSNumberFormatter()
        formatter.numberStyle = NSNumberFormatterStyle.CurrencyStyle
        formatter.locale = NSLocale(localeIdentifier: "en_US")
        
        return formatter.stringFromNumber(input)!
    }
}