//
//  ZKCarouselSlide.swift
//  ZKCarousel
//
//  Created by Zachary Khan on 8/22/20.
//

final public class ZKCarouselSlide : NSObject {
    
    public var slideImage : UIImage?
    public var slideTitle : String?
    public var slideDescription: String?
    
    public init(image: UIImage, title: String, description: String) {
        slideImage = image
        slideTitle = title
        slideDescription = description
    }
    
    override init() {
        super.init()
    }
    
}
