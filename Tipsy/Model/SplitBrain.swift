//
//  SplitBrain.swift
//  Tipsy
//
//  Created by Aravindh Sambanda Chandrasekaran on 21.7.2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct SplitBrain {
    
    var split : Split?
    var actualTipValue = "0%"
    var actualSplitValue = "1"
    
    mutating func convertTipPctToDouble(tipValue: String)-> Double {
        actualTipValue = tipValue
        let pctValue = String(tipValue.dropLast())
        let convertedValue = Double(pctValue)!
        let tip = convertedValue/100
        
        return tip
    }
    
    mutating func splitAmount(splitCount: String, billAmount: String, tip: Double) -> String {
        actualSplitValue = splitCount
        let splitValue = Double(splitCount) ?? 0.0
        let billAmount = Double(billAmount) ?? 0.00
        let tipAmount = tip * billAmount
        
        let finalAmount = (billAmount+tipAmount)/splitValue
        let result = String(format: "%.2f", finalAmount)
        
        split = Split(total: result, tip: actualTipValue, split: actualSplitValue)
        return result
    }
    
    func getSplitText() -> String {
        let splitText = "Split between \(split?.split ?? "0") people, with \(split?.tip ?? "0%") tip."
        
        return splitText
    }
}
