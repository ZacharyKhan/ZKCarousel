//
//  ZKCarouselSlide.swift
//  ZKCarousel
//
//  Created by Zachary Khan on 8/22/20.
//

public struct ZKCarouselSlide {
    public var image : UIImage?
    public var title : String?
    public var description: String?
    public var properties: ZKCarouselSlideProperties = ZKCarouselSlideProperties()
    
    public init(image: UIImage?, title: String?, description: String?, imageContentMode: UIView.ContentMode = .scaleAspectFill) {
        self.image = image
        self.title = title
        self.description = description
    }
    
    public init(image: UIImage?, title: String?, description: String?, properties: ZKCarouselSlideProperties) {
        self.image = image
        self.title = title
        self.description = description
        self.properties = properties
    }
}
