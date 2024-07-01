//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by James Clifford on 6/29/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var switchEUR: UISwitch!
    @IBOutlet weak var switchGBP: UISwitch!
    @IBOutlet weak var switchJPY: UISwitch!
    @IBOutlet weak var switchCAD: UISwitch!
    
    var amountEntered: Int = 0
    var currencySelected: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        errorLabel.text = ""
    }
    
    @IBAction func convertButtonTapped(_ sender: UIButton) {
        guard let amountText = amountTextField.text, let amount = Int(amountText) else {
            errorLabel.text = "Please enter a valid integer."
            return
        }
        
        amountEntered = amount
        currencySelected = []
        
        if switchEUR.isOn { currencySelected.append("EUR") }
        if switchGBP.isOn { currencySelected.append("GBP") }
        if switchJPY.isOn { currencySelected.append("JPY") }
        if switchCAD.isOn { currencySelected.append("CAD") }
        
        if currencySelected.isEmpty {
            errorLabel.text = "Please select at least one currency."
            return
        }
        
        errorLabel.text = ""
        performSegue(withIdentifier: "showResults", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showResults" {
            if let navigation = segue.destination as?
                ConverterView {
                navigation.amountEntered = amountEntered
                navigation.currencySelected = currencySelected
            }
        }
    }
}


