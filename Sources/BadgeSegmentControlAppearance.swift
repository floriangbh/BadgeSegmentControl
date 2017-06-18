//
//  SegmentAppearance.swift
//  BadgeSegmentControl
//
//  Created by terflogag on 03/02/2017.
//  Copyright (c) 2017 terflogag. All rights reserved.
//

import UIKit

open class BadgeSegmentControlAppearance {

    // MARK: - Var 

    open var segmentOnSelectionColour: UIColor
    open var segmentOffSelectionColour: UIColor
    open var segmentTouchDownColour: UIColor

    open var titleOnSelectionColour: UIColor
    open var titleOffSelectionColour: UIColor

    open var titleOnSelectionFont: UIFont
    open var titleOffSelectionFont: UIFont

    open var contentVerticalMargin: CGFloat

    open var dividerWidth: CGFloat
    open var dividerColour: UIColor

    open var cornerRadius: CGFloat
    open var borderWidth: CGFloat
    open var borderColor: UIColor

    open var backgroundColor: UIColor

    open var selectionBarColor: UIColor
    open var showSelectionBar: Bool
    open var selectionBarHeight: CGFloat

    // MARK: - Lifecycle

    /// Default init for appearance
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

        // Divider 
        self.dividerWidth = 1.0
        self.dividerColour = UIColor.black

        // Border 
        self.cornerRadius = 3.0
        self.borderWidth = 2.0
        self.borderColor = UIColor.black

        // Background 
        self.backgroundColor = UIColor.clear

        // Selection bar 
        self.selectionBarColor = UIColor.darkGray
        self.selectionBarHeight = 8.0
        self.showSelectionBar = false
    }
}
