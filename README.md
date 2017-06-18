<p align="center">
    <a href="https://cocoapods.org/pods/BadgeSegmentControl" target="_blank"><img src="https://img.shields.io/cocoapods/v/BadgeSegmentControl.svg?style=flat" alt="Cocoapods version" /></a>
    <a href="http://cocoapods.org/pods/BadgeSegmentControl" target="_blank"><img src="https://img.shields.io/cocoapods/l/BadgeSegmentControl.svg?style=flat" alt="Cocoapods licence" /></a>
    <a href="http://cocoapods.org/pods/BadgeSegmentControl" target="_blank"><img src="https://img.shields.io/cocoapods/p/BadgeSegmentControl.svg?style=flat" alt="Cocoapods plateform" /></a>
    <img src="https://img.shields.io/badge/PRs-welcome-brightgreen.svg" alt="Prs welcome" />
</p>

<p align="center">
<a href="#features">Features</a>
• <a href="#installation">Installation</a>
• <a href="#usage">Usage</a>
• <a href="#customisation">Customisation</a>
• <a href="#license">License</a>
</p>

Sweet segment control with image, text and badge ! Hightly customisable.

<p align="center">
    <img src="https://github.com/terflogag/BadgeSegmentControl/blob/master/Ressources/screen.png" alt="Screen"/>
</p>

## Features 

- [x] Segment control with only text 
- [x] Segment control with image and text 
- [x] Segment control with only image
- [x] Display badge 

## Todo (feel free to make PR)

- [ ] Unit & UI Test 

## Requirements

* Xcode 8 
* iOS 9.0+ target deployment
* Swift 3 project 
* Dependency with [SwiftBadge](https://github.com/marketplacer/swift-badge)

## Installation

- To integrate BadgeSegmentControl into your Xcode project using [CocoaPods](http://cocoapods.org), specify it in your Podfile :

```ruby
pod "BadgeSegmentControl"
```

- To integrate BadgeSegmentControl into your Xcode project using [Carthage](https://github.com/Carthage/Carthage), specify it in your Cartfile :

```ruby
github "terflogag/BadgeSegmentControl" 
```

## Usage

- Import the library : 

```swift
import BadgeSegmentControl
```

- Display the segment control programmatically : 

```swift
let padding: CGFloat = 50
let mySegmentControl = BadgeSegmentControl(frame: CGRect(x: padding / 2,
                                                         y: self.view.frame.height - (padding * 2),
                                                         width: self.view.frame.width - padding,
                                                         height: padding))
self.mySegmentControl?.segmentAppearance = SegmentControlAppearance.appearance()

// Add segments
self.mySegmentControl?.addSegmentWithTitle("First")
self.mySegmentControl?.addSegmentWithTitle("Second")
self.mySegmentControl?.addTarget(self,
                                 action: #selector(selectSegmentInSegmentView(segmentView:)),
                                 for: .valueChanged)

// Set segment with index 0 as selected by default
self.mySegmentControl?.selectedSegmentIndex = 0

// Add to subview
if let segmentControl = self.mySegmentControl {
    self.view.addSubview(segmentControl)
}
```

- Listen for change : 

```swift
// Segment selector for .ValueChanged
func selectSegmentInSegmentView(segmentView: BadgeSegmentControl) {
    print("Select segment at index: \(segmentView.selectedSegmentIndex)")
}
```

- From the storyboard : 

Just set an UIView with BadgeSegmentControl class and export to an IBOutlet.

## Customisation

```swift
import BadgeSegmentControl

func appearance() -> BadgeSegmentControlAppearence {
    let appearance = BadgeSegmentControlAppearence()

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

self.mySegmentControl?.segmentAppearance = self.appearance()
```

## Applications

Some application already use this segment control like :
- [Giraf](https://itunes.apple.com/fr/app/giraf/id1136592561?mt=8)

What about yours ? If your application also use this library, feel free to contact me or make pull request on the README 😁

## Author

Florian Gabach, contact@floriangabach.fr

## License

OpenSourceController is available under the [MIT license](LICENSE).

If your application use this segment control consider to add the licence in your Credits/About section. You can use [this library to do it](https://github.com/terflogag/OpenSourceController).
