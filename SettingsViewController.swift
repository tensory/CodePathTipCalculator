//
//  SettingsViewController.swift
//  CPTipCalculator
//
//  Created by Ari Lacenski on 9/26/16.
//  Copyright © 2016 Ari Lacenski. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, DidSetTipPercentageDelegate {

    @IBOutlet weak var tipSettingLabel: UILabel!
    
    @IBOutlet weak var tipSettingValue: UILabel!
    
    let tipPercentages = Constants.presetTipPercentages;
    
    var tipPercentageModalController: TipAmountViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = NSUserDefaults.standardUserDefaults();
        tipSettingValue.text = StringUtilities.getIntegerPercentage(defaults.doubleForKey(Constants.Settings.defaultTipPercentage))
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // http://stackoverflow.com/questions/24059195/delegate-in-swift-language
        tipPercentageModalController = segue.destinationViewController as? TipAmountViewController
        tipPercentageModalController!.delegate = self
    }
    
    func newTipPercentage(value: Double) {
        tipSettingValue.text = StringUtilities.getIntegerPercentage(value)
    }
}
