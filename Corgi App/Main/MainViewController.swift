//
//  MainViewController.swift
//  Corgi App
//
//  Created by Александр Сахнюков on 28/08/2018.
//  Copyright © 2018 Александр Сахнюков. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    var menuVc : LogInMenuViewController!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        swipeCustomisation()
        createMenuButtonInNavigationBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        menuClose(animationDuration: 0)
    }

    
    
    
    func menuOpen (animationDuration:Double) {
        UIView.animate(withDuration: animationDuration) { () -> Void in
            self.menuVc.view.frame = CGRect(x: 0, y: 60, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            self.menuVc.view.backgroundColor = UIColor.black.withAlphaComponent(0) // set color
            self.addChild(self.menuVc)
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
            menuClose(animationDuration: 0.3)}
    }
    
    
    @objc func respodToGesture(gesture : UISwipeGestureRecognizer) {
        switch gesture.direction {
        case UISwipeGestureRecognizer.Direction.right: menuOpen(animationDuration: 0.3)
        case UISwipeGestureRecognizer.Direction.left: menuCloseSwipe()
        default:
            break
        }
    }
    
  
    
    func swipeCustomisation() {
        menuVc = self.storyboard?.instantiateViewController(withIdentifier: "LogInMenuViewController") as? LogInMenuViewController
        let   swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.respodToGesture))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        
        let   swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.respodToGesture))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        
        self.view.addGestureRecognizer(swipeRight)
        self.view.addGestureRecognizer(swipeLeft)
        }
    
    @objc func menuButtonTabbed() {
        if AppDelegate.menu_bool {
            menuOpen(animationDuration: 0.3)
        } else {
            menuClose(animationDuration: 0.3)
        }
        }


    func createMenuButtonInNavigationBar () {
        let menuButton: UIBarButtonItem = {
            let button = UIBarButtonItem(image: UIImage(named: "MenuIcon"), style: .done, target: self, action: #selector (menuButtonTabbed))
            return button
        }()
        self.navigationItem.leftBarButtonItem = menuButton
    }
    }





