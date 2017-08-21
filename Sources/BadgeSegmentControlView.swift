//
//  Segment.swift
//  BadgeSegmentControl
//
//  Created by terflogag on 03/02/2017.
//  Copyright (c) 2017 terflogag. All rights reserved.
//

import UIKit
import BadgeSwift

open class BadgeSegmentControlView: UIView {

    // MARK: - Var 
    public var badgeValue: Int = 0
    
    // UI components
    fileprivate var imageView: UIImageView = UIImageView()

    fileprivate var label: UILabel = UILabel()

    fileprivate var badge: BadgeSwift = BadgeSwift()

    fileprivate var selectionbar: UIView = UIView()

    // Title
    public var title: String? {
        didSet {
            DispatchQueue.main.async(execute: {
                self.label.text = self.title
                self.layoutSubviews()
            })
        }
    }

    // Image
    open var onSelectionImage: UIImage?

    open var offSelectionImage: UIImage?

    // Appearance
    open var appearance: BadgeSegmentControlAppearance?

    internal var didSelectSegment: ((_ segment: BadgeSegmentControlView) -> Void)?

    public var index: Int = 0

    public var isSelected: Bool = false

    // MARK: - Lifecycle

    internal init(appearance: BadgeSegmentControlAppearance?) {
        super.init(frame: CGRect.zero)

        // Apperence 
        self.appearance = appearance

        // Prepare all element
        self.addUIElementsToView()
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Prepare

    /// Add all element into the view
    fileprivate func addUIElementsToView() {
        // Add ImageView
        self.imageView.contentMode = UIViewContentMode.scaleAspectFit
        self.addSubview(self.imageView)

        // Add label 
        self.label.textAlignment = NSTextAlignment.center
        self.addSubview(self.label)

        // Add badge
        self.addSubview(self.badge)
        self.badge.isHidden = true

        // Selection bar 
        self.addSubview(self.selectionbar)
        self.selectionbar.isHidden = true
    }

    /// Prepare all element appearence (badge, label, badge)
    internal func setupUIElements() {
        DispatchQueue.main.async(execute: {
            if let appearance = self.appearance {
                self.backgroundColor = appearance.segmentOffSelectionColour
                self.label.font = appearance.titleOffSelectionFont
                self.label.textColor = appearance.titleOffSelectionColour
                self.configureBadge()
                self.updateBadgeValue(forValue: 0)
                self.selectionbar.backgroundColor = appearance.selectionBarColor
            }
            self.imageView.image = self.offSelectionImage
        })
    }

    // MARK: - Layout 

    /// Apply layout to the view
    open override func layoutSubviews() {
        super.layoutSubviews()

        var distanceBetween: CGFloat = 0.0
        var verticalMargin: CGFloat = 0.0

        if let appearance = self.appearance {
            verticalMargin = appearance.contentVerticalMargin
        }

        // Image view
        let height = self.frame.size.height - (verticalMargin * 1.8)
        var imageViewFrame = CGRect(x: 0.0,
                                    y: self.frame.size.height / 2 - (height / 2),
                                    width: 0.0,
                                    height: height)

        if self.onSelectionImage != nil || self.offSelectionImage != nil {
            // Set imageView as a square
            imageViewFrame.size.width = self.frame.size.height - (verticalMargin * 1.5)
            distanceBetween = 8.0
        }

        // If there's no text, align image in the centre
        // Otherwise align text & image in the centre
        self.label.sizeToFit()
        let imageWidth = imageViewFrame.size.width
        let labelWidht = self.label.frame.size.width
        if self.label.frame.size.width == 0.0 {
            imageViewFrame.origin.x = max((self.frame.size.width - imageWidth) / 2.0, 0.0)
        } else {
            imageViewFrame.origin.x = max((self.frame.size.width - imageWidth - labelWidht) / 2.0 - distanceBetween,
                                          0.0)
        }
        self.imageView.frame = imageViewFrame

        // Label 
        self.label.frame = CGRect(x: imageViewFrame.origin.x + imageViewFrame.size.width + distanceBetween,
                                  y: verticalMargin,
                                  width: self.label.frame.size.width,
                                  height: self.frame.size.height - verticalMargin * 2)

        // Badge 
        self.badge.frame.origin.x = self.frame.size.width -
            self.badge.frame.width -
            (self.appearance?.borderWidth ?? 0) - 1
        self.positionBadge()

        // Selection bar 
        let barHeight: CGFloat = appearance?.selectionBarHeight ?? 5.0
        self.selectionbar.frame = CGRect(x: 0,
                                         y: self.frame.height - barHeight,
                                         width: self.frame.width,
                                         height: barHeight)
    }

    // MARK: Selections

    /// Set selected style 
    ///
    /// - Parameter selected: bool for selection state 
    internal func setSelected(_ selected: Bool) {
        self.isSelected = selected
        if selected == true {
            // Selected style 
            DispatchQueue.main.async(execute: {
                self.backgroundColor = self.appearance?.segmentOnSelectionColour
                self.label.textColor = self.appearance?.titleOnSelectionColour
                self.imageView.image = self.onSelectionImage

                if self.appearance?.showSelectionBar == true {
                    self.selectionbar.isHidden = false
                }
            })
        } else {
            // Unselected style
            DispatchQueue.main.async(execute: {
                self.backgroundColor = self.appearance?.segmentOffSelectionColour
                self.label.textColor = self.appearance?.titleOffSelectionColour
                self.imageView.image = self.offSelectionImage

                if self.appearance?.showSelectionBar == true {
                    self.selectionbar.isHidden = true
                }
            })
        }
    }

    // MARK: Handle touch

    /// When user start touch the segment view
    ///
    /// - Parameters:
    ///   - touches: touchs set 
    ///   - event: event reference
    override open func touchesBegan(_ touches: Set<UITouch>,
                                    with event: UIEvent?) {
        if self.isSelected == false {
            // Apply selection style 
            self.backgroundColor = self.appearance?.segmentTouchDownColour
        }
    }

    /// When user release the segment view
    ///
    /// - Parameters:
    ///   - touches: touchs set 
    ///   - event: event reference
    override open func touchesEnded(_ touches: Set<UITouch>,
                                    with event: UIEvent?) {
        if self.isSelected == false {
            // Apply normal style
            self.didSelectSegment?(self)
        }
    }

    // MARK: - Badge

    /// Adjuste badge position into the view
    private func positionBadge() {
        badge.translatesAutoresizingMaskIntoConstraints = false
        var constraints = [NSLayoutConstraint]()

        // Center the badge vertically in its container
        constraints.append(NSLayoutConstraint(
            item: self.badge,
            attribute: NSLayoutAttribute.centerY,
            relatedBy: NSLayoutRelation.equal,
            toItem: self,
            attribute: NSLayoutAttribute.centerY,
            multiplier: 1,
            constant: 0)
        )

        self.addConstraints(constraints)
    }

    /// Configure badge style, red by default 
    private func configureBadge() {
        // Font
        self.badge.font = UIFont.systemFont(ofSize: 11)

        // Insets
        self.badge.insets = CGSize(width: 5, height: 5)

        // Text color
        self.badge.textColor = UIColor.white

        // Badge color
        self.badge.badgeColor = UIColor.red

        // No shadow
        self.badge.shadowOpacityBadge = 0

        // Border width and color
        self.badge.borderWidth = 0.0
    }

    /// Update the badge value 
    /// Depend on value : 
    /// - <= 0, hide the badge 
    /// - > 0 && <= 99 : display the badge 
    /// - > 99 : display "+99"
    ///
    /// - Parameter value: the value to set 
    func updateBadgeValue(forValue value: Int) {
        self.badgeValue = value
        if value > 0 && value <= 99 {
            // Badge between 1 and 99
            self.badge.isHidden = false
            self.badge.text = "\(value)"
        } else if value > 99 {
            // Badge over 99 
            self.badge.isHidden = false
            self.badge.text = "+99"
        } else {
            // No badge 
            self.badge.isHidden = true
            self.badge.text = nil
        }
    }
}
