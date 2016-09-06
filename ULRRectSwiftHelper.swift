//
//  ULRRectSwiftHelper.swift
//  UltraLightRect
//
//  Created by Jason Dwyer on 5/4/16.
//  Copyright © 2016 Jason Dwyer. All rights reserved.
//
//  MIT Licensed. Use however you see fit.

import Foundation
import UIKit

@objc class ULRRectSwiftHelper: NSObject {
    
    func isPhone()->Bool {
        if UIDevice.currentDevice().userInterfaceIdiom == UIUserInterfaceIdiom.Phone {
            return true;
        }
        else {
            return false;
        }
    }
    
    func adaptiveFontSized(size: Int)->CGFloat {
        if self.isPhone() {
            return CGFloat(size);
        }
        else {
            return CGFloat(Double(size) * 1.8);
        }
    }
    
    //convert percent values to length based on screen size
    private func percentToLength(percent: Double, isForWidth: Bool)->CGFloat {
        let label = UILabel.init(frame: self.quickFrameWithXPoint(10, YPoint: 10, Width: 10, Height: 10))
        label.font = UIFont.systemFontOfSize(self.adaptiveFontSized(32))
        if isForWidth {
            let screenSize: CGRect = UIScreen.mainScreen().bounds
            return screenSize.width * (CGFloat(percent) / 100)
        }
        else {
            let screenSize: CGRect = UIScreen.mainScreen().bounds
            return screenSize.height * (CGFloat(percent) / 100)
        }
    }
    
    func quickFrameWithXPoint(XPoint: Double, YPoint: Double, Width: Double, Height: Double)->CGRect {
        let returnFrame : CGRect = CGRectMake(percentToLength(XPoint, isForWidth: true), percentToLength(YPoint, isForWidth: false), percentToLength(Width, isForWidth: true), percentToLength(Height, isForWidth: false))
        return returnFrame
    }
    
    func squareFrameWithXPoint(XPoint: Double, YPoint: Double, sideLengthAsPercentOfWidth: Double)->CGRect {
        let returnFrame : CGRect = CGRectMake(percentToLength(XPoint, isForWidth: true), percentToLength(YPoint, isForWidth: false), percentToLength(sideLengthAsPercentOfWidth, isForWidth: true), percentToLength(sideLengthAsPercentOfWidth, isForWidth: true))
        return returnFrame
    }
    

    
}