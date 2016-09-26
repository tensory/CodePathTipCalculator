//
//  ViewController.swift
//  CPTipCalculator
//
//  Created by Ari Lacenski on 9/25/16.
//  Copyright © 2016 Ari Lacenski. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let tipPercentages: [Double] = [0.18, 0.2, 0.25]
    
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTapScreen(sender: AnyObject) {
        self.view.endEditing(true)
    }
    
    @IBAction func calculateTip(sender: AnyObject) {
        
        let billAmount: Double = Double(billField.text!) ?? 0
        let tipPercent = tipPercentages[tipControl.selectedSegmentIndex]

        let tipAmount = billAmount * tipPercent
        
        tipLabel.text = String(format: "$%.2f", tipAmount)
        totalLabel.text = String(format: "$%.2f", billAmount + tipAmount)
    }
}

