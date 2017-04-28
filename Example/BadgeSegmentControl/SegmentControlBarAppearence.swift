//
//  SegmentControlBarAppearence.swift
//  BadgeSegmentControl
//
//  Created by Florian Gabach on 28/04/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation
import BadgeSegmentControl

class SegmentControlBarAppearence: NSObject {
    
    class func appearance() -> BadgeSegmentControlAppearance {
        let appearance = BadgeSegmentControlAppearance()
        
        // Segment color 
        appearance.segmentOnSelectionColour = .clear
        appearance.segmentOffSelectionColour = .clear
        
        // Title font 
        appearance.titleOnSelectionFont = UIFont.systemFont(ofSize: 14)
        appearance.titleOffSelectionFont = UIFont.systemFont(ofSize: 14)
        
        // Title color 
        appearance.titleOnSelectionColour = UIColor(red:1.00, green:0.62, blue:0.22, alpha:1.00)
        appearance.titleOffSelectionColour = UIColor.white
        
        // Vertical margin 
        appearance.contentVerticalMargin = 10.0
        
        // Border style
        appearance.borderColor = .clear
        appearance.cornerRadius = 0.0
        appearance.borderWidth = 0.0
        
        // Divider style
        appearance.dividerWidth = 1.0
        appearance.dividerColour = .clear
        
        // Selection bar 
        appearance.showSelectionBar = true
        appearance.selectionBarHeight = 5
        appearance.selectionBarColor = UIColor.white.withAlphaComponent(0.5)
        
        return appearance
    }
}
