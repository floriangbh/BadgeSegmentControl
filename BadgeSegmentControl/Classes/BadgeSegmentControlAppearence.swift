//
//  SegmentAppearance.swift
//  BadgeSegmentControl
//
//  Created by terflogag on 03/02/2017.
//  Copyright (c) 2017 terflogag. All rights reserved.
//

import UIKit

open class BadgeSegmentControlAppearence {

    // MARK: - Var 

    open var segmentOnSelectionColour: UIColor
    open var segmentOffSelectionColour: UIColor
    open var segmentTouchDownColour: UIColor

    open var titleOnSelectionColour: UIColor
    open var titleOffSelectionColour: UIColor

    open var titleOnSelectionFont: UIFont
    open var titleOffSelectionFont: UIFont

    open var contentVerticalMargin: CGFloat

    // MARK: - Lifecycle

    public init() {
        // Segment style initialization 
        self.segmentOnSelectionColour = UIColor.darkGray
        self.segmentOffSelectionColour = UIColor.gray
        self.segmentTouchDownColour = UIColor.white.withAlphaComponent(0.4)

        // Title style initialization 
        self.titleOnSelectionColour = UIColor.white
        self.titleOffSelectionColour = UIColor.darkGray
        self.titleOnSelectionFont = UIFont.systemFont(ofSize: 17.0)
        self.titleOffSelectionFont = UIFont.systemFont(ofSize: 17.0)

        // Margin initialization
        self.contentVerticalMargin = 5.0
    }
}
