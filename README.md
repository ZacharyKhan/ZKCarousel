# ZKCarousel

[![CI Status](http://img.shields.io/travis/ZacharyKhan/ZKCarousel.svg?style=flat)](https://travis-ci.org/ZacharyKhan/ZKCarousel)
[![Version](https://img.shields.io/cocoapods/v/ZKCarousel.svg?style=flat)](http://cocoapods.org/pods/ZKCarousel)
[![License](https://img.shields.io/cocoapods/l/ZKCarousel.svg?style=flat)](http://cocoapods.org/pods/ZKCarousel)
[![Platform](https://img.shields.io/cocoapods/p/ZKCarousel.svg?style=flat)](http://cocoapods.org/pods/ZKCarousel)

## Demo
![](https://media.giphy.com/media/Wk7oUM8HnHOes/giphy.gif)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first. Then, open the `.xcworkspace` and run the project within Xcode.

## Installation

ZKCarousel is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby

pod 'ZKCarousel'

```

Then, `cd` into the directory containing your `podfile` and run `pod install`

## Usage

`ZKCarousel` can be instantiated either programatically or via Storyboards. 

#### Storyboards

See example project for instructions on how to use `ZKCarousel` with storyboards.

#### Programatically

```swift 
import UIKit
import ZKCarousel

class ViewController : UIViewController {

    let carousel : ZKCarousel = {
        let carousel = ZKCarousel()
        
        // Create as many slides as you'd like to show in the carousel
        let slide = ZKCarouselSlide(image: #imageLiteral(resourceName: "demo2"), title: "Hello There 👻", description: "Welcome to the ZKCarousel demo! Swipe left to view more slides!")
        let slide1 = ZKCarouselSlide(image: #imageLiteral(resourceName: "demo"), title: "A Demo Slide ☝🏼", description: "lorem ipsum devornum cora fusoa foen sdie ha odab ebakldf shjbesd ljkhf")
        let slide2 = ZKCarouselSlide(image: #imageLiteral(resourceName: "demo2"), title: "Another Demo Slide ✌🏼", description: "lorem ipsum devornum cora fusoa foen ebakldf shjbesd ljkhf")     
        
        // Add the slides to the carousel
        carousel.slides = [slide, slide1, slide2]
        
        return carousel
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.carousel.frame = CGRect()
        self.view.addSubView(self.carousel)
    }

}

```

## Contributions

If you're interested in contributing to `ZKCarousel`, please fork the repository and submit a pull request. All contributions are welcome and encouraged! :)

For all bug reports, feature requests, etc. please submit an issue to the repository.

## License

ZKCarousel is available under the MIT license. See the LICENSE file for more info.
