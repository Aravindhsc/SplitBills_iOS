//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    var tip = 0.10
    var finalAmount: String?
    var splitBrain  = SplitBrain()
    
    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        billTextField.endEditing(true)
        
        let tipValue = sender.currentTitle!
        tip = splitBrain.convertTipPctToDouble(tipValue: tipValue)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        sender.stepValue = 1
        sender.minimumValue = 1
        let splitValue = sender.value
        splitNumberLabel.text = String(format: "%.0f", splitValue)
    }
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        let splitValue = splitNumberLabel.text!
        let billAmount = billTextField.text!
                
        finalAmount = splitBrain.splitAmount(splitCount: splitValue, billAmount: billAmount, tip: tip)
        
        
        self.performSegue(withIdentifier: "goToResults", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.totalValue = finalAmount
            destinationVC.settingsVale = splitBrain.getSplitText()
        }
    }
    
    
}

