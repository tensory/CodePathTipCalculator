//
//  ViewController.swift
//  CPTipCalculator
//
//  Created by Ari Lacenski on 9/25/16.
//  Copyright © 2016 Ari Lacenski. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let tipPercentages: [Double] = Constants.presetTipPercentages
    
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!

    
    @IBOutlet weak var tipAmountSlider: DiscreteUISlider!
    @IBOutlet weak var tipAmountSliderLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        tipAmountSlider.initialize(tipPercentages)
        tipAmountSlider.value = tipAmountSlider.minimumValue
        
        tipAmountSliderLabel.text = StringUtilities.getIntegerPercentage(tipAmountSlider.getDataValue())
        
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        if let tipPercentage: Double = defaults.doubleForKey(Constants.Settings.defaultTipPercentage) {
            tipControl.selectedSegmentIndex = tipPercentages.indexOf(tipPercentage)!
        } else {
            defaults.setDouble(tipPercentages[0], forKey: Constants.Settings.defaultTipPercentage)
            defaults.synchronize()
        }
    }
    
    @IBAction func onDragSliderSticky(sender: AnyObject) {
        let displayValue: Double = tipAmountSlider.getDataValue()
        
        calculateTip(displayValue)
        tipAmountSliderLabel.text = StringUtilities.getIntegerPercentage(displayValue)
        tipAmountSlider.setDiscretePosition()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTapScreen(sender: AnyObject) {
        self.view.endEditing(true)
    }
    
    @IBAction func calculateTip(sender: AnyObject) {
        _calculateTip(tipAmountSlider.getDataValue())
    }
    
    func _calculateTip(tipPercentage: Double) {
        let billAmount: Double = Double(billField.text!) ?? 0
        let tipAmount = billAmount * tipPercentage
        
        tipLabel.text = String(format: "$%.2f", tipAmount)
        totalLabel.text = String(format: "$%.2f", billAmount + tipAmount)
    }
}