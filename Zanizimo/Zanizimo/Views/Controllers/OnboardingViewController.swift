//
//  OnboardingViewController.swift
//  Zanizimo
//
//  Created by Ricardo Yepez on 1/28/19.
//  Copyright © 2019 Ricardo Yepez. All rights reserved.
//

import UIKit
import UserNotifications

class OnboardingViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!{
        didSet{
            scrollView.delegate = self
        }
    }
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    var slides:[Slide] = [];
    override func viewDidLoad() {
        super.viewDidLoad()
        slides = createSlides()
        setupSlideScrollView(slides: slides)
        
        pageControl.numberOfPages = slides.count
        pageControl.currentPage = 0
        view.bringSubviewToFront(pageControl)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func createSlides() -> [Slide] {
        
        
        let slide1:Slide = SlideModel(imageName: "ODHG1L1", labelTitle: "Zanizimo", labelDesc: "App for Food Tracking", buttonTitle: "", isVisible: false).toSlide()
        
        let slide2:Slide = SlideModel(imageName: "planner", labelTitle: "Calendar", labelDesc: "You can review your meals weekly", buttonTitle: "", isVisible: false).toSlide()
        
        let slide3:Slide = SlideModel(imageName: "heart", labelTitle: "Validating", labelDesc: "Validating the food will help you to know your eating habits", buttonTitle: "", isVisible: false).toSlide()
        
        
        let slide4:Slide = SlideModel(imageName: "note", labelTitle: "Notification", labelDesc: "Turn on notifications to get reminders and keep up with your goals.", buttonTitle: "", isVisible: false).toSlide()
        
        let slide5:Slide = SlideModel(imageName: "about", labelTitle: "Almost Done", labelDesc: "Before starting let us know you", buttonTitle: "Yes", isVisible: true).toSlide()
        
        
        //        let slide5:Slide = SlideModel(imageName: "approval", labelTitle: "Almost Done", labelDesc: "You are all set up and ready to use Zanizimo. Let's Begin.", buttonTitle: "Done", isVisible: true).toSlide()
        
        slide5.buttonNext.addTarget(self, action: #selector(self.nextView), for: .touchUpInside)
        
        
        
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
    
    @objc func nextView(){
        let storyboard = UIStoryboard(name: "Form", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "formViewController")
        self.present(controller, animated: true, completion: nil)
    }
    
    @objc func notification(){
        
        let notificationCenter = UNUserNotificationCenter.current()
        
        notificationCenter.getNotificationSettings { (settings) in
            
            
            let notificationAuthorizationStatus = settings.authorizationStatus
            
            switch notificationAuthorizationStatus {
            case .notDetermined: do {
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge], completionHandler: {didAllow, error in
                    
                })
                }
            case .authorized, .provisional: do{
                return
                }
            case .denied: do{
                let settingsAppURL = URL(string: UIApplication.openSettingsURLString)!
                
                let alert = UIAlertController(
                    title: "Need Notification Access",
                    message: "Notification access is required to make full use of this app.",
                    preferredStyle: UIAlertController.Style.alert
                )
                
                
                alert.addAction(UIAlertAction(title: "Allow Notification", style: .cancel, handler: { (alert) -> Void in
                    UIApplication.shared.open(settingsAppURL, options: [:], completionHandler: nil)
                }))
                alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
                
                self.present(alert, animated: true, completion: nil)
                }
            }
        }
    }
    
    
}

extension OnboardingViewController:UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        pageControl.currentPage = Int(pageIndex)
        
        let maximumHorizontalOffset: CGFloat = scrollView.contentSize.width - scrollView.frame.width
        let currentHorizontalOffset: CGFloat = scrollView.contentOffset.x
        
        // vertical
        let maximumVerticalOffset: CGFloat = scrollView.contentSize.height - scrollView.frame.height
        let currentVerticalOffset: CGFloat = scrollView.contentOffset.y
        
        let percentageHorizontalOffset: CGFloat = currentHorizontalOffset / maximumHorizontalOffset
        let percentageVerticalOffset: CGFloat = currentVerticalOffset / maximumVerticalOffset
        
        let percentOffset: CGPoint = CGPoint(x: percentageHorizontalOffset, y: percentageVerticalOffset)
        
        if(percentOffset.x > 0 && percentOffset.x <= 0.25) {
            
            slides[0].imageView.transform = CGAffineTransform(scaleX: (0.25-percentOffset.x)/0.25, y: (0.25-percentOffset.x)/0.25)
            slides[1].imageView.transform = CGAffineTransform(scaleX: percentOffset.x/0.25, y: percentOffset.x/0.25)
            
        } else if(percentOffset.x > 0.25 && percentOffset.x <= 0.50) {
            slides[1].imageView.transform = CGAffineTransform(scaleX: (0.50-percentOffset.x)/0.25, y: (0.50-percentOffset.x)/0.25)
            slides[2].imageView.transform = CGAffineTransform(scaleX: percentOffset.x/0.50, y: percentOffset.x/0.50)
            
        } else if(percentOffset.x > 0.50 && percentOffset.x <= 0.75) {
            slides[2].imageView.transform = CGAffineTransform(scaleX: (0.75-percentOffset.x)/0.25, y: (0.75-percentOffset.x)/0.25)
            slides[3].imageView.transform = CGAffineTransform(scaleX: percentOffset.x/0.75, y: percentOffset.x/0.75)
            
        } else if(percentOffset.x > 0.75 && percentOffset.x <= 1) {
            slides[3].imageView.transform = CGAffineTransform(scaleX: (1-percentOffset.x)/0.25, y: (1-percentOffset.x)/0.25)
            slides[4].imageView.transform = CGAffineTransform(scaleX: percentOffset.x, y: percentOffset.x)
        }
    }
    
    func fade(fromRed: CGFloat,
              fromGreen: CGFloat,
              fromBlue: CGFloat,
              fromAlpha: CGFloat,
              toRed: CGFloat,
              toGreen: CGFloat,
              toBlue: CGFloat,
              toAlpha: CGFloat,
              withPercentage percentage: CGFloat) -> UIColor {
        
        let red: CGFloat = (toRed - fromRed) * percentage + fromRed
        let green: CGFloat = (toGreen - fromGreen) * percentage + fromGreen
        let blue: CGFloat = (toBlue - fromBlue) * percentage + fromBlue
        let alpha: CGFloat = (toAlpha - fromAlpha) * percentage + fromAlpha
        
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }

}
