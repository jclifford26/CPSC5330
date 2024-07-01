//
//  ConverterView.swift
//  CurrencyConverter
//
//  Created by James Clifford on 6/29/24.
//

import UIKit

class ConverterView: UIViewController {
    
    @IBOutlet weak var labelEUR: UILabel!
    @IBOutlet weak var labelGBP: UILabel!
    @IBOutlet weak var labelJPY: UILabel!
    @IBOutlet weak var labelCAD: UILabel!
    
    var amountEntered: Int = 0
    var currencySelected: [String] = []

    let conversionRates = [
        "EUR": 0.93,
        "GBP": 0.79,
        "JPY": 161.0,
        "CAD": 1.37
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelEUR.isHidden = true
        labelGBP.isHidden = true
        labelJPY.isHidden = true
        labelCAD.isHidden = true
        
        for currency in currencySelected {
            if let rate = conversionRates[currency] {
                let amountConverted = Double(amountEntered) * rate
                switch currency {
                case "EUR":
                    labelEUR.isHidden = false
                    labelEUR.text = "\(amountConverted)"
                case "GBP":
                    labelGBP.isHidden = false
                    labelGBP.text = "\(amountConverted)"
                case "JPY":
                    labelJPY.isHidden = false
                    labelJPY.text = "\(amountConverted)"
                case "CAD":
                    labelCAD.isHidden = false
                    labelCAD.text = "\(amountConverted)"
                default:
                    break
                }
            }
        }
    }
}

