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
            menuOpen()
        } else {
            menuClose()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
navigationController?.navigationBar.setBackgroundImage(backNavigationImage, for: UIBarMetrics.default)
      menuVc = self.storyboard?.instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
        menuClose()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func menuOpen () {
       
        UIView.animate(withDuration: 0.4) { () -> Void in
            self.menuVc.view.frame = CGRect(x: 0, y: 60, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            self.menuVc.view.backgroundColor = UIColor.black.withAlphaComponent(0) // set color
            self.addChildViewController(self.menuVc)
            self.view.addSubview(self.menuVc.view)
            AppDelegate.menu_bool = false

        }
        
    
    }
   
    
    func menuClose () {
        UIView.animate(withDuration: 0.4, animations: { () -> Void in
            self.menuVc.view.frame = CGRect(x: -UIScreen.main.bounds.width, y: 60, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)}) { (finished) in
            
            self.menuVc.view.removeFromSuperview()
        
        }
        AppDelegate.menu_bool = true
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
