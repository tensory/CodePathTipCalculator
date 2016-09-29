//
//  DiscreteUISlider.s
//  CPTipCalculator
//
//  Created by Ari Lacenski on 9/28/16.
//  Copyright © 2016 Ari Lacenski. All rights reserved.
//  Inspired by http://stackoverflow.com/questions/7083375/ios-how-to-make-slider-stop-at-discrete-points

import UIKit

class DiscreteUISlider : UISlider {
    var data: [Double]?
    var dataValue: Double?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func initialize(data: [Double]) {
        self.data = data
        self.continuous = false
        self.minimumValue = Float(data.first!)
        self.maximumValue = Float(data.last!)
        
        self.dataValue = Double(minimumValue)
    }
    
    func setDiscreteValue(newValue: Double) {
        let floatVal = Float(newValue)
        if (!(floatVal >= self.minimumValue && floatVal <= self.maximumValue)) {
            fatalError("Value \(floatVal) is not in range.")
        }
        self.setValue(floatVal, animated: false)
        self.setDiscretePosition()
    }
    
    func setDiscretePosition() {
        switch self.value {
        case let v where v < 0.19:
            self.value = self.minimumValue
        case let v where v >= 0.19 && v < 0.225:
            self.value = (self.minimumValue + self.maximumValue) / 2
        case let v where v >= 0.225:
            self.value = self.maximumValue
        default:
            return
        }
    }
    
    func getDataValue() -> Double {
        switch self.value {
        case let v where v < 0.19:
            return self.data![0]
        case let v where v >= 0.19 && v < 0.225:
            return self.data![1]
        case let v where v >= 0.225:
            return self.data![2]
        default:
            return 0
        }
    }
}