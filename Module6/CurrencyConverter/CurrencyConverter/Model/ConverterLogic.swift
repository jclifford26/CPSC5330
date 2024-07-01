//
//  ConverterLogic.swift
//  CurrencyConverter
//
//  Created by James Clifford on 6/29/24.
//

import Foundation

class CurrencyConverter {
    let conversionRates: [String: Double] = [
        "EUR": 0.93,
        "GBP": 0.79,
        "JPY": 161.0,
        "CAD": 1.37
    ]
    
    func convert(amount: Int, to currency: String) -> Double? {
        guard let rate = conversionRates[currency] else { return nil }
        return Double(amount) * rate
    }
}

