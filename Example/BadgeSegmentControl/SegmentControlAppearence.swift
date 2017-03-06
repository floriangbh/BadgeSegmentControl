//
//  SegmentAppearence.swift
//  BadgeSegmentControl
//
//  Created by Florian Gabach on 02/03/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation
import BadgeSegmentControl

class SegmentControlAppearence: NSObject {
    
    class func appearence() -> BadgeSegmentControlAppearence {
        let appearance = BadgeSegmentControlAppearence()
        
        // Segment color 
        appearance.segmentOnSelectionColour = UIColor.white
        appearance.segmentOffSelectionColour = UIColor(red:1.00, green:0.62, blue:0.22, alpha:1.00)
        
        // Title font 
        appearance.titleOnSelectionFont = UIFont.systemFont(ofSize: 14)
        appearance.titleOffSelectionFont = UIFont.systemFont(ofSize: 14)
        
        // Title color 
        appearance.titleOnSelectionColour = UIColor(red:1.00, green:0.62, blue:0.22, alpha:1.00)
        appearance.titleOffSelectionColour = UIColor.white
        
        // Vertical margin 
        appearance.contentVerticalMargin = 10.0
        
        return appearance

    }
}
