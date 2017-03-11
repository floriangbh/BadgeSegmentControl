//
//  ViewController.swift
//  BadgeSegmentControl
//
//  Created by terflogag on 03/02/2017.
//  Copyright (c) 2017 terflogag. All rights reserved.
//

import UIKit
import BadgeSegmentControl

class ViewController: UIViewController {

    // MARK : - IBOutlet

    @IBOutlet weak var segmentView: BadgeSegmentControl!

    @IBOutlet weak var simpleSegmentView: BadgeSegmentControl!

    @IBOutlet weak var imageSegmentView: BadgeSegmentControl!

    // MARK: - Var

    fileprivate let mainColor = UIColor(red:1.00, green:0.62, blue:0.22, alpha:1.00)

    fileprivate var firstBadgeValue: Int = 0

    fileprivate var secondBadgeValue: Int = 0

    fileprivate var programaticallySegmentedControl: BadgeSegmentControl?

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Background color
        self.view.backgroundColor = self.mainColor

        // Prepare two segment for demo 
        self.prepareTextAndImageSegment()
        self.prepareSimpleSegment()
        self.prepareOnlyImageSegment()
        self.addWithoutStoryboard()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Prepare segment 

    /// Prepare the first segment without image and badge 
    func prepareSimpleSegment() {
        self.simpleSegmentView.segmentAppearance = SegmentControlAppearence.appearence()
        self.simpleSegmentView.dividerColour = UIColor(white: 0.95, alpha: 0.3)
        self.simpleSegmentView.dividerWidth = 1.0
        self.simpleSegmentView.backgroundColor = UIColor.clear

        self.simpleSegmentView.layer.cornerRadius = 5.0
        self.simpleSegmentView.layer.borderColor = UIColor.white.cgColor
        self.simpleSegmentView.layer.borderWidth = 2.0

        // Add segments
        self.simpleSegmentView.addSegmentWithTitle("Emojiraf")
        self.simpleSegmentView.addSegmentWithTitle("Messages")

        self.simpleSegmentView.addTarget(self, action: #selector(selectSegmentInSegmentView(segmentView:)),
                                         for: .valueChanged)

        // Set segment with index 0 as selected by default
        self.simpleSegmentView.selectedSegmentIndex = 0
    }

    /// Prepare the second segment with image and badge 
    func prepareTextAndImageSegment() {
        self.segmentView.segmentAppearance = SegmentControlAppearence.appearence()
        self.segmentView.dividerColour = UIColor(white: 0.95, alpha: 0.3)
        self.segmentView.dividerWidth = 1.0
        self.segmentView.backgroundColor = UIColor.clear

        self.segmentView.layer.cornerRadius = 5.0
        self.segmentView.layer.borderColor = UIColor.white.cgColor
        self.segmentView.layer.borderWidth = 2.0

        // Add segments
        self.segmentView.addSegmentWithTitle("Emojiraf",
                                             onSelectionImage: UIImage(named: "emoji")?.imageWithColor(self.mainColor),
                                             offSelectionImage: UIImage(named: "emoji")?.imageWithColor(UIColor.white))
        self.segmentView.addSegmentWithTitle("Messages",
                                             onSelectionImage: UIImage(named: "message")?.imageWithColor(self.mainColor),
                                             offSelectionImage: UIImage(named: "message")?.imageWithColor(UIColor.white))

        self.segmentView.addTarget(self, action: #selector(selectSegmentInSegmentView(segmentView:)),
                                   for: .valueChanged)

        // Set segment with index 0 as selected by default
        self.segmentView.selectedSegmentIndex = 0
    }

    /// Prepare the second segment with image and badge 
    func prepareOnlyImageSegment() {
        self.imageSegmentView.segmentAppearance = SegmentControlAppearence.appearence()
        self.imageSegmentView.dividerColour = UIColor(white: 0.95, alpha: 0.3)
        self.imageSegmentView.dividerWidth = 1.0
        self.imageSegmentView.backgroundColor = UIColor.clear

        self.imageSegmentView.layer.cornerRadius = 5.0
        self.imageSegmentView.layer.borderColor = UIColor.white.cgColor
        self.imageSegmentView.layer.borderWidth = 2.0

        // Add segments
        self.imageSegmentView.addSegmentWithTitle("",
                                                  onSelectionImage: UIImage(named: "emoji")?.imageWithColor(self.mainColor),
                                                  offSelectionImage: UIImage(named: "emoji")?.imageWithColor(UIColor.white))
        self.imageSegmentView.addSegmentWithTitle("",
                                                  onSelectionImage: UIImage(named: "message")?.imageWithColor(self.mainColor),
                                                  offSelectionImage: UIImage(named: "message")?.imageWithColor(UIColor.white))

        self.imageSegmentView.addTarget(self, action: #selector(selectSegmentInSegmentView(segmentView:)),
                                        for: .valueChanged)

        // Set segment with index 0 as selected by default
        self.imageSegmentView.selectedSegmentIndex = 0
    }

    func addWithoutStoryboard() {
        self.programaticallySegmentedControl = BadgeSegmentControl(frame: CGRect(x: self.view.frame.width / 2 - ((self.view.frame.width - 50) / 2),
                                                                                 y: self.view.frame.height - 80,
                                                                                 width: self.view.frame.width - 50,
                                                                                 height: 50))
        self.programaticallySegmentedControl?.segmentAppearance = SegmentControlAppearence.appearence()
        self.programaticallySegmentedControl?.dividerColour = UIColor(white: 0.95, alpha: 0.3)
        self.programaticallySegmentedControl?.dividerWidth = 1.0
        self.programaticallySegmentedControl?.backgroundColor = UIColor.clear

        self.programaticallySegmentedControl?.layer.cornerRadius = 5.0
        self.programaticallySegmentedControl?.layer.borderColor = UIColor.white.cgColor
        self.programaticallySegmentedControl?.layer.borderWidth = 2.0

        // Add segments
        self.programaticallySegmentedControl?.addSegmentWithTitle("Emojiraf")
        self.programaticallySegmentedControl?.addSegmentWithTitle("Messages")

        self.programaticallySegmentedControl?.addTarget(self,
                                                       action: #selector(selectSegmentInSegmentView(segmentView:)),
                                                       for: .valueChanged)

        // Set segment with index 0 as selected by default
        self.programaticallySegmentedControl?.selectedSegmentIndex = 0

        // Add to subview
        if let segmentControl = self.programaticallySegmentedControl {
            self.view.addSubview(segmentControl)
        }
    }

    // MARK: - Action 

    @IBAction func doUpdateFirstBadgeClick(_ sender: Any) {
        self.firstBadgeValue += 1
        self.segmentView.updateBadge(forValue: self.firstBadgeValue,
                                     andSection: 0)

        self.imageSegmentView.updateBadge(forValue: self.firstBadgeValue,
                                          andSection: 0)

        self.simpleSegmentView.updateBadge(forValue: self.firstBadgeValue,
                                           andSection: 0)
    }

    @IBAction func doUpdateSecondBadgeClick(_ sender: Any) {
        self.secondBadgeValue += 1
        self.segmentView.updateBadge(forValue: self.secondBadgeValue,
                                     andSection: 1)

        self.imageSegmentView.updateBadge(forValue: self.secondBadgeValue,
                                          andSection: 1)

        self.simpleSegmentView.updateBadge(forValue: self.secondBadgeValue,
                                           andSection: 1)
    }

    // Segment selector for .ValueChanged
    func selectSegmentInSegmentView(segmentView: BadgeSegmentControl) {
        print("Select segment at index: \(segmentView.selectedSegmentIndex)")
    }
}
