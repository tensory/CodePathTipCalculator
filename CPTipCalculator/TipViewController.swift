//
//  ViewController.swift
//  CPTipCalculator
//
//  Created by Ari Lacenski on 9/25/16.
//  Copyright © 2016 Ari Lacenski. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billFrame: UIView!
    
    let tipPercentages: [Double] = Constants.presetTipPercentages
    
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    
    @IBOutlet weak var tipAmountSlider: DiscreteUISlider!
    @IBOutlet weak var tipAmountSliderLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        tipAmountSlider.initialize(tipPercentages)
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        if let tipPercentage: Double = defaults.doubleForKey(Constants.Settings.defaultTipPercentage) {
            tipAmountSlider.setDiscreteValue(tipPercentage)
        } else {
            let minimum = tipPercentages.first!
            defaults.setDouble(minimum, forKey: Constants.Settings.defaultTipPercentage)
            defaults.synchronize()
            tipAmountSlider.setDiscreteValue(minimum)

        }
        tipAmountSliderLabel.text = StringUtilities.getIntegerPercentage(tipAmountSlider.getDataValue())
        
        billField.becomeFirstResponder()
        self.setBillAreaColor(tipAmountSlider.getDataValue())
    }
    
    @IBAction func onDragSliderSticky(sender: AnyObject) {
        let displayValue: Double = tipAmountSlider.getDataValue()
        
        calculateTip(displayValue)
        tipAmountSliderLabel.text = StringUtilities.getIntegerPercentage(displayValue)
        tipAmountSlider.setDiscretePosition()
        
        self.setBillAreaColor(displayValue)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTapScreen(sender: AnyObject) {
        self.view.endEditing(true)
        
        if let billAmountStr: String = billField.text {
            let formatter = NSNumberFormatter()
            if !billAmountStr.isEmpty && billAmountStr.characters.first! == "$" {
                formatter.numberStyle = .CurrencyStyle
            }
            let billAmount:Double = Double(formatter.numberFromString(billAmountStr)!)
            self.billField.text = StringUtilities.getCurrencyValue(billAmount)
        }
    }
    
    @IBAction func calculateTip(sender: AnyObject) {
        _calculateTip(tipAmountSlider.getDataValue())
    }
    
    func _calculateTip(tipPercentage: Double) {
        func decodeCurrencyNumber(input: String?) -> Double {
            if let billStr = input {
                let formatter = NSNumberFormatter()
                if !billStr.isEmpty && billStr.characters.first! == "$" {
                    formatter.numberStyle = .CurrencyStyle
                }
                if let result = formatter.numberFromString(billStr) {
                    return Double(result)
                }
            }
            return 0
        }
        let billAmount: Double = decodeCurrencyNumber(billField.text)
        
        let tipAmount = billAmount * tipPercentage
        
        tipLabel.text = StringUtilities.getCurrencyValue(tipAmount)
        totalLabel.text = StringUtilities.getCurrencyValue(billAmount + tipAmount)
    }
    
    func setBillAreaColor(value: Double) {
        let color: UIColor
        
        enum Colors {
            case purple, pink, red
            func getColor() -> UIColor {
                switch self {
                case .purple:
                    return UIColor(netHex: 0x797FF2)
                case .pink:
                    return UIColor(netHex: 0xF279B4)
                case red:
                    return UIColor(netHex: 0xF27B79)
                }
            }
        }
        
        switch value {
        case tipPercentages[0]:
            color = Colors.purple.getColor()
        case tipPercentages[1]:
            color = Colors.pink.getColor()
        case tipPercentages[2]:
            color = Colors.red.getColor()
        default:
            color = UIColor.whiteColor()
        }
        
        billFrame.backgroundColor = color
    }
}