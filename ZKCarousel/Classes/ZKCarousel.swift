//
//  ZKCarousel.swift
//  Delego
//
//  Created by Zachary Khan on 6/8/17.
//  Copyright © 2017 ZacharyKhan. All rights reserved.
//

import UIKit

final public class ZKCarousel: UIView, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    
    public var slides : [ZKCarouselSlide] = [] {
        didSet {
            self.collectionView.reloadData()
        }
    }
    
    public lazy var pageControl : UIPageControl = {
        let control = UIPageControl()
        control.numberOfPages = 3
        control.currentPage = 0
        control.hidesForSinglePage = true
        control.pageIndicatorTintColor = .lightGray
        control.currentPageIndicatorTintColor = UIColor(red:0.20, green:0.60, blue:0.86, alpha:1.0)
        return control
    }()
    
    fileprivate lazy var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.delegate = self
        cv.dataSource = self
        cv.isPagingEnabled = true
        cv.register(carouselCollectionViewCell.self, forCellWithReuseIdentifier: "slideCell")
        cv.clipsToBounds = true
        cv.backgroundColor = .clear
        cv.showsHorizontalScrollIndicator = false
        cv.bounces = false
        return cv
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupCarousel()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupCarousel()
    }
    
    private func setupCarousel() {
        self.backgroundColor = .clear

        self.addSubview(collectionView)
        self.addConstraintsWithFormat("H:|[v0]|", views: collectionView)
        self.addConstraintsWithFormat("V:|[v0]|", views: collectionView)
        
        self.addSubview(pageControl)
        self.addConstraintsWithFormat("H:|-20-[v0]-20-|", views: pageControl)
        self.addConstraintsWithFormat("V:[v0(25)]-5-|", views: pageControl)
        self.bringSubview(toFront: pageControl)
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "slideCell", for: indexPath) as! carouselCollectionViewCell
        cell.slide = self.slides[indexPath.item]
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(slides.count)
        return self.slides.count
    }
    
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        return size
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageControl.currentPage = Int(pageNumber)
    }
    
}

fileprivate class carouselCollectionViewCell: UICollectionViewCell {
    
    fileprivate var slide : ZKCarouselSlide? {
        didSet {
            self.parseData(forSlide: slide!)
        }
    }
    
    private lazy var imageView : UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.backgroundColor = .clear
        iv.clipsToBounds = true
        iv.addBlackGradientLayer(frame: self.bounds)
        return iv
    }()
    
    private var titleLabel : UILabel = {
        let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private var descriptionLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 19)
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        self.backgroundColor = .clear
        self.clipsToBounds = true
        
        self.addSubview(self.imageView)
        self.addConstraintsWithFormat("H:|[v0]|", views: self.imageView)
        self.addConstraintsWithFormat("V:|[v0]|", views: self.imageView)
        
        self.addSubview(self.descriptionLabel)
        let left = NSLayoutConstraint(item: descriptionLabel, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: 15)
        let right = NSLayoutConstraint(item: descriptionLabel, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1.0, constant: -15)
        let bottom = NSLayoutConstraint(item: descriptionLabel, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 0.9, constant: 0)
        let top = NSLayoutConstraint(item: descriptionLabel, attribute: .top, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.25, constant: 0)
        NSLayoutConstraint.activate([left, right, bottom, top])
        
        self.addSubview(self.titleLabel)
        self.addConstraintsWithFormat("H:|-15-[v0]-15-|", views: self.titleLabel)
        self.addConstraintsWithFormat("V:[v0(43)]-[v1]", views: self.titleLabel, self.descriptionLabel)
    }
    
    private func parseData(forSlide slide: ZKCarouselSlide) {
        if let image = slide.slideImage {
            self.imageView.image = image
        }
        
        if let title = slide.slideTitle {
            self.titleLabel.text = title
        }
        
        if let description = slide.slideDescription {
            self.descriptionLabel.text = description
        }
    }
}

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

extension UIView {
    
    func addConstraintsWithFormat(_ format: String, views: UIView...) {
        
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            viewsDictionary[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
    
    
}

extension UIImageView {
    func addBlackGradientLayer(frame: CGRect){
        let gradient = CAGradientLayer()
        gradient.frame = frame
        gradient.colors = [UIColor.clear.cgColor, UIColor.black.withAlphaComponent(0.8).cgColor]
        gradient.locations = [0.0, 0.6]
        self.layer.insertSublayer(gradient, at: 0)
    }
}
