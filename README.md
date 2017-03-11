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

- [ ] Carthage support 
- [ ] Unit & UI Test 

## Requirements

* Xcode 8 
* iOS 9.0+ target deployment
* Swift 3 project 
* Dependency with [SwiftBadge](https://github.com/marketplacer/swift-badge)

## Installation

BadgeSegmentControl is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "BadgeSegmentControl"
```

## Usage

- Import the library : 

```swift
import BadgeSegmentControl
```

- Display the segment control : 

```swift
TODO
```

- From the storyboard : 

Just set an UIView with BadgeSegmentControl class and export to an IBOutlet.

## Customisation

For customisation, I think the better way is to subclass BadgeSegmentControl like the exemple bellow :

```swift
import BadgeSegmentControl

class MyCustomSegmentControl: BadgeSegmentControl {
    
    // MARK: - Appearence 

    fileprivate func appearence() -> BadgeSegmentControlAppearence {
        let appearance = BadgeSegmentControlAppearence()

        // Segment color 
        appearance.segmentOnSelectionColour = UIColor.white
        appearance.segmentOffSelectionColour = UIColor.red
        appearance.segmentTouchDownColour = UIColor.white.withAlphaComponent(0.4)

        // Title font 
        appearance.titleOnSelectionFont = <font>
        appearance.titleOffSelectionFont = <font>

        // Title color 
        appearance.titleOnSelectionColour = UIColor.red
        appearance.titleOffSelectionColour = UIColor.white

        // Vertical margin 
        appearance.contentVerticalMargin = 10.0

        return appearance
    }

    func applyAppearence() {
        // Appearence 
        self.segmentAppearance = self.appearence()

        // Divider
        self.dividerColour = UIColor(white: 0.95, alpha: 0.3)
        self.dividerWidth = 1.0

        // Background
        self.backgroundColor = UIColor.clear

        // Border 
        self.layer.cornerRadius = 5
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 2.0

        // Set segment with index 0 as selected by default
        self.selectedSegmentIndex = 0
    }
}

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
