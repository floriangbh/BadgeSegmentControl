//
//  SegmentAppearence.swift
//  BadgeSegmentControl
//
//  Created by Florian Gabach on 02/03/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit

class SegmentControlAppearance: NSObject {

    class func appearance() -> BadgeSegmentControlAppearance {
        let appearance = BadgeSegmentControlAppearance()

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

        // Border style
        appearance.borderColor = UIColor.white
        appearance.cornerRadius = 5.0
        appearance.borderWidth = 2.0

        // Divider style
        appearance.dividerWidth = 1.0
        appearance.dividerColour = UIColor(white: 0.95, alpha: 0.3)

        return appearance
    }
}
