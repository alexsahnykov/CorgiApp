//
//  ViewController.swift
//  Corgi App
//
//  Created by Александр Сахнюков on 28/08/2018.
//  Copyright © 2018 Александр Сахнюков. All rights reserved.
//

import UIKit

class FirstLaunchController: UIViewController,UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageCotroll: UIPageControl!
    @IBOutlet weak var toMainButton: UIButton!
    @IBAction func toMainButton(_ sender: Any) {
        performSegue(withIdentifier: "ToMainViewSegue", sender: self)
    }
    
     var slides:[Slide] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        toMainButton.isHidden = true
        scrollView.delegate = self
        slides =  createSlides()
        setupSlideScrollView(slides: slides)
        pageCotroll.numberOfPages = slides.count
        pageCotroll.currentPage = 0
        view.bringSubviewToFront(pageCotroll)
        }
    
    
    func createSlides() -> [Slide] {
        
        let slide1:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide1.imgeView.image = UIImage(named: "Mask")
        slide1.titleLable.text = "A real-life bear"
        slide1.textLable.text = "Did you know that Winnie the chubby little cubby was based on a real, young bear in London"
       
        
        let slide2:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide2.imgeView.image = UIImage(named: "LockIcon")
        slide2.titleLable.text = "A real-life bear"
        slide2.textLable.text = "Did you know that Winnie the chubby little cubby was based on a real, young bear in London"

        
        let slide3:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide3.imgeView.image = UIImage(named: "Mask")
        slide3.titleLable.text = "A real-life bear"
        slide3.textLable.text = "Did you know that Winnie the chubby little cubby was based on a real, young bear in London"

        
        let slide4:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide4.imgeView.image = UIImage(named: "LockIcon")
        slide4.titleLable.text = "A real-life bear"
        slide4.textLable.text = "Did you know that Winnie the chubby little cubby was based on a real, young bear in London"

        
        
        let slide5:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide5.imgeView.image = UIImage(named: "Mask")
        slide5.titleLable.text = "A real-life bear"
        slide5.textLable.text = "Did you know that Winnie the chubby little cubby was based on a real, young bear in London"

        return [slide1, slide2, slide3, slide4, slide5]
    }
 
    func setupSlideScrollView(slides : [Slide]) {
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: view.frame.height)
        scrollView.isPagingEnabled = true
        
        for i in 0 ..< slides.count {
            slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
            scrollView.addSubview(slides[i])
        }
    }
   
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        pageCotroll.currentPage = Int(pageIndex)
        
        let maximumHorizontalOffset: CGFloat = scrollView.contentSize.width - scrollView.frame.width
        let currentHorizontalOffset: CGFloat = scrollView.contentOffset.x
        
        // vertical
        let maximumVerticalOffset: CGFloat = scrollView.contentSize.height - scrollView.frame.height
        let currentVerticalOffset: CGFloat = scrollView.contentOffset.y
        
        let percentageHorizontalOffset:  CGFloat = currentHorizontalOffset / maximumHorizontalOffset
        let percentageVerticalOffset: CGFloat = currentVerticalOffset / maximumVerticalOffset
        
        let percentOffset: CGPoint = CGPoint(x: percentageHorizontalOffset, y: percentageVerticalOffset)
        
        if(percentOffset.x > 0 && percentOffset.x <= 0.25) {
            
            slides[0].imgeView.transform = CGAffineTransform(scaleX: (0.25-percentOffset.x)/0.25, y: (0.25-percentOffset.x)/0.25)
            slides[1].imgeView.transform = CGAffineTransform(scaleX: percentOffset.x/0.25, y: percentOffset.x/0.25)
            
        } else if(percentOffset.x > 0.25 && percentOffset.x <= 0.50) {
            slides[1].imgeView.transform = CGAffineTransform(scaleX: (0.50-percentOffset.x)/0.25, y: (0.50-percentOffset.x)/0.25)
            slides[2].imgeView.transform = CGAffineTransform(scaleX: percentOffset.x/0.50, y: percentOffset.x/0.50)
            
        } else if(percentOffset.x > 0.50 && percentOffset.x <= 0.75) {
            slides[2].imgeView.transform = CGAffineTransform(scaleX: (0.75-percentOffset.x)/0.25, y: (0.75-percentOffset.x)/0.25)
            slides[3].imgeView.transform = CGAffineTransform(scaleX: percentOffset.x/0.75, y: percentOffset.x/0.75)
            
        } else if(percentOffset.x > 0.75 && percentOffset.x <= 1) {
            slides[3].imgeView.transform = CGAffineTransform(scaleX: (1-percentOffset.x)/0.25, y: (1-percentOffset.x)/0.25)
            slides[4].imgeView.transform = CGAffineTransform(scaleX: percentOffset.x, y: percentOffset.x)
            toMainButton.isHidden = false
        }
    }
}

