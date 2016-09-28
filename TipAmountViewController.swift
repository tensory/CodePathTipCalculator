//
//  TipAmountViewController.swift
//  CPTipCalculator
//
//  Created by Ari Lacenski on 9/27/16.
//  Copyright © 2016 Ari Lacenski. All rights reserved.
//

import UIKit

class TipAmountViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var tipPercentagePicker: UIPickerView!
    
    let data: [Double] = Constants.presetTipPercentages
    
    var tipPercentage: Double?
    var delegate: DidSetTipPercentageDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tipPercentagePicker.dataSource = self
        tipPercentagePicker.delegate = self
        
        let defaults = NSUserDefaults.standardUserDefaults();
        let rowPosition: Int = data.indexOf(defaults.doubleForKey(Constants.Settings.defaultTipPercentage)) ?? 0
        
        tipPercentagePicker.selectRow(rowPosition, inComponent: 0, animated: false)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // UIPickerViewDataSource
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data.count
    }
    
    // UIPickerViewDelegate
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return StringUtilities.getIntegerPercentage(data[row])
    }
    
    // on select
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        tipPercentage = data[row]
    }

    @IBAction func onConfirm(sender: AnyObject) {
        if let newTipPercentage = self.tipPercentage {
            self.delegate!.newTipPercentage(newTipPercentage)
        }
        
        self.dismissViewControllerAnimated(true, completion: {
            if let newTipPercentage = self.tipPercentage {
                let defaults = NSUserDefaults.standardUserDefaults();
                defaults.setDouble(newTipPercentage, forKey: Constants.Settings.defaultTipPercentage)
                defaults.synchronize()
            }
        })
    }
}
