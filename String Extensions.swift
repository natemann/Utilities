//
//  String Extensions.swift
//  Budget
//
//  Created by Nathan Mann on 3/31/15.
//  Copyright (c) 2015 Nate. All rights reserved.
//

import Foundation

extension String {
    
    func toDouble() -> Double? {
        //        ordinary number string to double
        if let double = NSNumberFormatter().numberFromString(self)?.doubleValue {
            return double
        }
        else {
            //            currency string to double
            let formatter = NSNumberFormatter()
            
            formatter.numberStyle = .CurrencyStyle
            formatter.negativeFormat = "-¤#,##0.00"
            return formatter.numberFromString(self)?.doubleValue
        }
    }
    
    
    func toNSDecimalNumber() -> NSDecimalNumber? {
        if let double = toDouble() {
            return NSDecimalNumber(double: double)
        }
        return nil
    }
    
    
    func substringExcludingEndingChar(char: Character) -> String {
        let end = find(self, char)
        return end == nil ? self : self[self.startIndex..<end!]
    }
    
    
    func removeWhiteSpace() -> String {
        return self.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
    }
}