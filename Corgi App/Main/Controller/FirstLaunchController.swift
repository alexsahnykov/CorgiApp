//
//  ViewController.swift
//  Corgi App
//
//  Created by Александр Сахнюков on 28/08/2018.
//  Copyright © 2018 Александр Сахнюков. All rights reserved.
//

import UIKit

class FirstLaunchController: UIViewController {
    
    @IBAction func haveCorgiButton(_ sender: Any) {
    self.performSegue(withIdentifier: "FromFirstToMain", sender: Any?.self)
        }
    @IBAction func noCorgiButton(_ sender: Any) {
        }
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        }
    override func viewDidAppear(_ animated: Bool) {

                   }
    
    
    
  /*  func checkFirstLaunch() {
        let launchedBefore = UserDefaults.standard.bool(forKey: "launchedBefore")
        var rooVC:UIViewController
        if launchedBefore  {
    rooVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainStoryboardID") as! MainViewController
            //      self.performSegue(withIdentifier: "FromFirstToMain", sender: nil)
        } else {
            UserDefaults.standard.set(true, forKey: "launchedBefore")
                rooVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FirstlaunchStoryboardID") as! FirstLaunchController
                }
        let appDelagate = UIApplication.shared.delegate as! AppDelegate
        appDelagate.window?.rootViewController = rooVC
        
        }
*/
    
    
    
}

