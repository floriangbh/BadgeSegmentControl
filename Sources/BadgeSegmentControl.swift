//
//  SegmentView.swift
//  BadgeSegmentControl
//
//  Created by terflogag on 03/02/2017.
//  Copyright (c) 2017 terflogag. All rights reserved.
//

import UIKit

open class BadgeSegmentControl: UIControl {

    public var segmentAppearance: BadgeSegmentControlAppearance? {
        didSet {
            self.applyAppearence()
        }
    }

    public var dividerColour: UIColor = UIColor.lightGray {
        didSet {
            self.setNeedsDisplay()
        }
    }

    public var dividerWidth: CGFloat = 1.0 {
        didSet {
            self.updateSegmentsLayout()
        }
    }

    public var selectedSegmentIndex: Int {
        get {
            if let segment = self.selectedSegment {
                return segment.index
            } else {
                return UISegmentedControlNoSegment
            }
        }
        set(newIndex) {
            self.deselectSegment()
            if newIndex >= 0 && newIndex < self.segments.count {
                let currentSelectedSegment = self.segments[newIndex]
                self.selectSegment(currentSelectedSegment)
            }
        }
    }

    public var numberOfSegments: Int {
        get {
            return segments.count
        }
    }

    fileprivate var segments: [BadgeSegmentControlView] = []

    fileprivate var selectedSegment: BadgeSegmentControlView?

    // MARK: - Lifecycle

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        // Init 
        self.layer.masksToBounds = true
        self.segmentAppearance = BadgeSegmentControlAppearance()
    }

    override public init(frame: CGRect) {
        super.init(frame: frame)

        // Init 
        self.layer.masksToBounds = true
        self.segmentAppearance = BadgeSegmentControlAppearance()
    }

    public init(frame: CGRect,
                segmentAppearance: BadgeSegmentControlAppearance) {
        super.init(frame: frame)

        // Init 
        self.segmentAppearance = segmentAppearance
        self.layer.masksToBounds = true
    }

    fileprivate func applyAppearence() {
        let appearence: BadgeSegmentControlAppearance = self.segmentAppearance ?? BadgeSegmentControlAppearance()

        // Divider
        self.dividerColour = appearence.dividerColour
        self.dividerWidth = appearence.dividerWidth

        // Background 
        self.backgroundColor = appearence.backgroundColor
        
        // Border 
        self.layer.borderWidth = appearence.borderWidth
        self.layer.cornerRadius = appearence.cornerRadius
        self.layer.borderColor = appearence.borderColor.cgColor
    }

    // MARK: - Actions

    fileprivate func selectSegment(_ segment: BadgeSegmentControlView) {
        segment.setSelected(true)
        self.selectedSegment = segment
        self.sendActions(for: .valueChanged)
    }

    fileprivate func deselectSegment() {
        self.selectedSegment?.setSelected(false)
        self.selectedSegment = nil
    }

    // MARK: - Manage Segment

    public func addSegmentWithTitle(_ title: String,
                                    onSelectionImage: UIImage? = nil,
                                    offSelectionImage: UIImage? = nil) {
        self.insertSegmentWithTitle(title,
                                    onSelectionImage: onSelectionImage,
                                    offSelectionImage: offSelectionImage,
                                    index: self.segments.count)
    }

    public func insertSegmentWithTitle(_ title: String?,
                                       onSelectionImage: UIImage?,
                                       offSelectionImage: UIImage?,
                                       index: Int) {

        let segment = BadgeSegmentControlView(appearance: self.segmentAppearance)

        segment.title = title
        segment.onSelectionImage = onSelectionImage
        segment.offSelectionImage = offSelectionImage
        segment.index = index
        segment.didSelectSegment = { [weak self] segment in
            if self!.selectedSegment != segment {
                self!.deselectSegment()
                self!.selectSegment(segment)
            }
        }
        segment.setupUIElements()

        self.resetSegmentIndicesWithIndex(index, byIndex: 1)
        self.segments.insert(segment, at: index)

        self.addSubview(segment)
        self.layoutSubviews()
    }

    public func removeSegmentAtIndex(_ index: Int) {
        assert(index >= 0 && index < self.segments.count, "Index (\(index)) is out of range")

        if index == self.selectedSegmentIndex {
            self.selectedSegmentIndex = UISegmentedControlNoSegment
        }
        self.resetSegmentIndicesWithIndex(index, byIndex: -1)
        let segment = self.segments.remove(at: index)
        segment.removeFromSuperview()
        self.updateSegmentsLayout()
    }

    fileprivate func resetSegmentIndicesWithIndex(_ index: Int, byIndex: Int) {
        if index < self.segments.count {
            for i in index..<self.segments.count {
                let segment = self.segments[i]
                segment.index += byIndex
            }
        }
    }

    // MARK: - Layout 

    open override func layoutSubviews() {
        super.layoutSubviews()
        self.updateSegmentsLayout()
    }

    fileprivate func updateSegmentsLayout() {

        guard self.segments.count > 0 else {
            return
        }

        if self.segments.count > 1 {
            let segmentWidth = ceil((self.frame.size.width -
                self.dividerWidth * CGFloat(self.segments.count-1)) / CGFloat(self.segments.count))

            var originX: CGFloat = 0.0
            for segment in self.segments {
                segment.frame = CGRect(x: originX, y: 0.0, width: segmentWidth, height: self.frame.size.height)
                originX += segmentWidth + self.dividerWidth
            }

        } else {
            self.segments[0].frame = CGRect(x: 0.0, y: 0.0,
                                            width: self.frame.size.width,
                                            height: self.frame.size.height)
        }

        self.setNeedsDisplay()
    }

    // MARK: Drawing

    override open func draw(_ rect: CGRect) {
        super.draw(rect)

        let context = UIGraphicsGetCurrentContext()!
        self.drawDividerWithContext(context)
    }

    fileprivate func drawDividerWithContext(_ context: CGContext) {

        context.saveGState()

        if self.segments.count > 1 {
            let path = CGMutablePath()

            var originX: CGFloat = self.segments[0].frame.size.width + self.dividerWidth/2.0
            for index in 1..<self.segments.count {
                path.move(to: CGPoint(x: originX, y: 0.0))
                path.addLine(to: CGPoint(x: originX, y: self.frame.size.height))

                originX += self.segments[index].frame.width + self.dividerWidth
            }

            context.addPath(path)
            context.setStrokeColor(self.dividerColour.cgColor)
            context.setLineWidth(self.dividerWidth)
            context.drawPath(using: CGPathDrawingMode.stroke)
        }

        context.restoreGState()
    }

    // MARK: - Manage badge 

    public func updateBadge(forValue value: Int, andSection section: Int) {
        self.segments[section].updateBadgeValue(forValue: value)
    }
    
    func badgeValue(for section: Int) -> Int {
        return segments[section].badgeValue
    }
}
