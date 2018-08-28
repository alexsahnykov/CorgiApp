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

           checkFirstLaunch()
        }
    
    
    
    func checkFirstLaunch() {
        let launchedBefore = UserDefaults.standard.bool(forKey: "launchedBefore")
        if launchedBefore  {
            self.performSegue(withIdentifier: "FromFirstToMain", sender: nil)
        } else {
            print("First launch, setting UserDefault.")
            UserDefaults.standard.set(true, forKey: "launchedBefore")
                }
        }

}

