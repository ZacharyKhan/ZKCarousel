//
//  ViewController.swift
//  ZKCarousel
//
//  Created by ZacharyKhan on 06/09/2017.
//  Copyright (c) 2017 ZacharyKhan. All rights reserved.
//

import UIKit
import ZKCarousel

class ViewController: UIViewController {
    
    @IBOutlet var carousel: ZKCarousel! = ZKCarousel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupCarousel()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func setupCarousel() {
        let slide = ZKCarouselSlide(image: #imageLiteral(resourceName: "demo2"), title: "Hello There 👻", description: "Welcome to the ZKCarousel demo! Swipe left to view more slides!")
        let slide1 = ZKCarouselSlide(image: #imageLiteral(resourceName: "demo"), title: "A Demo Slide ☝🏼", description: "lorem ipsum devornum cora fusoa foen sdie ha odab ebakldf shjbesd ljkhf")
        let slide2 = ZKCarouselSlide(image: #imageLiteral(resourceName: "demo2"), title: "Another Demo Slide ✌🏼", description: "lorem ipsum devornum cora fusoa foen ebakldf shjbesd ljkhf")
        self.carousel.slides = [slide, slide1, slide2]
    }

}

