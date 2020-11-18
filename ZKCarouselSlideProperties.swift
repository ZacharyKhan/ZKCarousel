//
//  ZKCarouselSlideProperties.swift
//  Pods
//
//  Created by Alessandro Zoffoli on 18/11/20.
//

import Foundation

public class ZKCarouselSlideProperties {
    public var contentMode: UIView.ContentMode
    public var shouldAddGradient: Bool
    
    public init(contentMode: UIView.ContentMode = .scaleAspectFill, shouldAddGradient: Bool = true) {
        self.contentMode = contentMode
        self.shouldAddGradient = shouldAddGradient
    }
}
