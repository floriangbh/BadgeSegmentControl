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

    // UI components
    fileprivate var imageView: UIImageView = UIImageView()
    fileprivate var label: UILabel = UILabel()
    fileprivate var badge: BadgeSwift = BadgeSwift()

    // Title
    open var title: String? {
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
    open var appearance: BadgeSegmentControlAppearence?

    internal var didSelectSegment: ((_ segment: BadgeSegmentControlView) -> Void)?

    open internal(set) var index: Int = 0
    open fileprivate(set) var isSelected: Bool = false

    // MARK: - Lifecycle

    // Init
    internal init(appearance: BadgeSegmentControlAppearence?) {

        self.appearance = appearance

        super.init(frame: CGRect.zero)
        self.addUIElementsToView()
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    fileprivate func addUIElementsToView() {
        // Add ImageView
        self.imageView.contentMode = UIViewContentMode.scaleAspectFit
        self.addSubview(self.imageView)

        // Add label 
        self.label.textAlignment = NSTextAlignment.center
        self.addSubview(self.label)

        // Add badge
        self.addSubview(self.badge)
    }

    internal func setupUIElements() {
        DispatchQueue.main.async(execute: {
            if let appearance = self.appearance {
                self.backgroundColor = appearance.segmentOffSelectionColour
                self.label.font = appearance.titleOffSelectionFont
                self.label.textColor = appearance.titleOffSelectionColour
                self.configureBadge(self.badge)
                self.updateBadgeValue(forValue: 0)
            }
            self.imageView.image = self.offSelectionImage
        })
    }

    // MARK: - Layout 

    open override func layoutSubviews() {
        super.layoutSubviews()

        var distanceBetween: CGFloat = 0.0
        var verticalMargin: CGFloat = 0.0

        if let appearance = self.appearance {
            verticalMargin = appearance.contentVerticalMargin
        }

        var imageViewFrame = CGRect(x: 0.0,
                                    y: verticalMargin / 2,
                                    width: 0.0,
                                    height: self.frame.size.height - verticalMargin)

        if self.onSelectionImage != nil || self.offSelectionImage != nil {
            // Set imageView as a square
            imageViewFrame.size.width = self.frame.size.height - verticalMargin
            distanceBetween = 5.0
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
        self.label.frame = CGRect(x: imageViewFrame.origin.x + imageViewFrame.size.width + distanceBetween,
                                  y: verticalMargin,
                                  width: self.label.frame.size.width,
                                  height: self.frame.size.height - verticalMargin * 2)

        // Badge position
        self.badge.frame.origin.x = self.frame.size.width - self.badge.frame.width - 10
        self.positionBadge(self.badge)
    }

    // MARK: Selections

    internal func setSelected(_ selected: Bool) {
        self.isSelected = selected
        if selected == true {
            DispatchQueue.main.async(execute: {
                self.backgroundColor = self.appearance?.segmentOnSelectionColour
                self.label.textColor = self.appearance?.titleOnSelectionColour
                self.imageView.image = self.onSelectionImage
            })
        } else {
            DispatchQueue.main.async(execute: {
                self.backgroundColor = self.appearance?.segmentOffSelectionColour
                self.label.textColor = self.appearance?.titleOffSelectionColour
                self.imageView.image = self.offSelectionImage
            })
        }
    }

    // MARK: Handle touch

    override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if self.isSelected == false {
            self.backgroundColor = self.appearance?.segmentTouchDownColour
        }
    }

    override open func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if self.isSelected == false {
            self.didSelectSegment?(self)
        }
    }

    // MARK: - Badge

    private func positionBadge(_ badge: UIView) {
        badge.translatesAutoresizingMaskIntoConstraints = false
        var constraints = [NSLayoutConstraint]()

        // Center the badge vertically in its container
        constraints.append(NSLayoutConstraint(
            item: badge,
            attribute: NSLayoutAttribute.centerY,
            relatedBy: NSLayoutRelation.equal,
            toItem: self,
            attribute: NSLayoutAttribute.centerY,
            multiplier: 1,
            constant: 0)
        )

        self.addConstraints(constraints)
    }

    private func configureBadge(_ badge: BadgeSwift) {
        // Font
        badge.font = UIFont.systemFont(ofSize: 11)

        // Insets
        badge.insets = CGSize(width: 5, height: 5)

        // Text color
        badge.textColor = UIColor.white

        // Badge color
        badge.badgeColor = UIColor.red

        // No shadow
        badge.shadowOpacityBadge = 0

        // Border width and color
        badge.borderWidth = 0.0
    }

    func updateBadgeValue(forValue value: Int) {
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
