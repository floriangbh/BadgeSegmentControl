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
    
    class func appearence() -> SegmentAppearance {
        let appearance = SegmentAppearance()
        appearance.segmentOnSelectionColour = UIColor(red:1.00, 
                                                      green:0.62, 
                                                      blue:0.22, 
                                                      alpha:1.00)
        appearance.segmentOffSelectionColour = UIColor.white
        appearance.titleOnSelectionFont = UIFont.systemFont(ofSize: 12.0)
        appearance.titleOffSelectionFont = UIFont.systemFont(ofSize: 12.0)
        appearance.contentVerticalMargin = 10.0
        
        return appearance
    }
}
