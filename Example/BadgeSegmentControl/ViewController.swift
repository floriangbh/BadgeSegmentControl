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
    
    @IBOutlet weak var segmentView: SegmentView!
    @IBOutlet weak var simpleSegmentView: SegmentView!
    
    // MARK: - Var
    
    var margin: CGFloat = 10.0
    var firstBadgeValue: Int = 0
    var secondBadgeValue: Int = 0
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Prepare two segment for demo 
        self.prepareImageSegment()
        self.prepareSimpleSegment()
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
        self.simpleSegmentView.layer.borderColor = UIColor(white: 0.85, 
                                                     alpha: 1.0).cgColor
        self.simpleSegmentView.layer.borderWidth = 1.0
        
        // Add segments
        self.simpleSegmentView.addSegmentWithTitle("Emojiraf")
        self.simpleSegmentView.addSegmentWithTitle("Messagerie")
        
        self.simpleSegmentView.addTarget(self, action: #selector(selectSegmentInSegmentView(segmentView:)), 
                                   for: .valueChanged)
        
        // Set segment with index 0 as selected by default
        self.simpleSegmentView.selectedSegmentIndex = 0
    }
    
    /// Prepare the second segment with image and badge 
    func prepareImageSegment() {
        self.segmentView.segmentAppearance = SegmentControlAppearence.appearence()
        self.segmentView.dividerColour = UIColor(white: 0.95, alpha: 0.3)
        self.segmentView.dividerWidth = 1.0
        self.segmentView.backgroundColor = UIColor.clear
        
        self.segmentView.layer.cornerRadius = 5.0
        self.segmentView.layer.borderColor = UIColor(white: 0.85, 
                                                     alpha: 1.0).cgColor
        self.segmentView.layer.borderWidth = 1.0
        
        // Add segments
        self.segmentView.addSegmentWithTitle("Emojiraf", 
                                             onSelectionImage: UIImage(named: "clip_light"), 
                                             offSelectionImage: UIImage(named: "clip"))
        self.segmentView.addSegmentWithTitle("Messagerie", 
                                             onSelectionImage: UIImage(named: "bulb_light"), 
                                             offSelectionImage: UIImage(named: "bulb"))
        
        self.segmentView.addTarget(self, action: #selector(selectSegmentInSegmentView(segmentView:)), 
                                   for: .valueChanged)
        
        // Set segment with index 0 as selected by default
        self.segmentView.selectedSegmentIndex = 0
    }
    
    // Segment selector for .ValueChanged
    func selectSegmentInSegmentView(segmentView: SegmentView) {
        print("Select segment at index: \(segmentView.selectedSegmentIndex)")
    }
    
    // MARK: - Action 
    
    @IBAction func doUpdateFirstBadgeClick(_ sender: Any) {
        self.firstBadgeValue += 1
        self.segmentView.updateBadge(forValue: self.firstBadgeValue, 
                                     andSection: 0)
    }
    
    @IBAction func doUpdateSecondBadgeClick(_ sender: Any) {
        self.secondBadgeValue += 1
        self.segmentView.updateBadge(forValue: self.secondBadgeValue, 
                                     andSection: 1)
    }
}

