//
//  MainViewController.swift
//  Corgi App
//
//  Created by Александр Сахнюков on 28/08/2018.
//  Copyright © 2018 Александр Сахнюков. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
var backNavigationImage = UIImage(named: "NavigationBack.png")
    
    var menuVc : MenuViewController!
    
    
    @IBAction func MenuButton(_ sender: Any) {
        if AppDelegate.menu_bool {
            menuOpen(animationDuration: 0.4)
        } else {
            menuClose(animationDuration: 0.4)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
navigationController?.navigationBar.setBackgroundImage(backNavigationImage, for: UIBarMetrics.default)
      menuVc = self.storyboard?.instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
        
        
        let   swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.respodToGesture))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        
        let   swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.respodToGesture))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        
        self.view.addGestureRecognizer(swipeRight)
         self.view.addGestureRecognizer(swipeLeft)
        
        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        menuClose(animationDuration: 0)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func menuOpen (animationDuration:Double) {
       
        UIView.animate(withDuration: animationDuration) { () -> Void in
            self.menuVc.view.frame = CGRect(x: 0, y: 60, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            self.menuVc.view.backgroundColor = UIColor.black.withAlphaComponent(0) // set color
            self.addChildViewController(self.menuVc)
            self.view.addSubview(self.menuVc.view)
            AppDelegate.menu_bool = false

        }
        
    
    }
   
    
    func menuClose (animationDuration:Double) {
        UIView.animate(withDuration: animationDuration, animations: { () -> Void in
            self.menuVc.view.frame = CGRect(x: -UIScreen.main.bounds.width, y: 60, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)}) { (finished) in
            
            self.menuVc.view.removeFromSuperview()
        
        }
        AppDelegate.menu_bool = true
    }
    func menuCloseSwipe () {
        if AppDelegate.menu_bool {

        } else {
            menuClose(animationDuration: 0.4)
        }
    }
    
    
    @objc func respodToGesture(gesture : UISwipeGestureRecognizer) {
        switch gesture.direction {
        case UISwipeGestureRecognizerDirection.right:
            menuOpen(animationDuration: 0.4)
        case UISwipeGestureRecognizerDirection.left:
            menuCloseSwipe()
        default:
            break
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
