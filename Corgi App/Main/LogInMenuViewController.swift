//
//  MenuViewController.swift
//  Corgi App
//
//  Created by Александр Сахнюков on 28/08/2018.
//  Copyright © 2018 Александр Сахнюков. All rights reserved.
//

import UIKit

class LogInMenuViewController: UIViewController {
    @IBOutlet weak var menuAvatarImage: UIImageView!
    
    @IBOutlet weak var accountIcon: UIImageView!
    @IBOutlet weak var menuView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0)
        self.menuView.backgroundColor = UIColor(white: 1, alpha: 0)
        menuAvatarImage.layer.cornerRadius = menuAvatarImage.frame.size.width / 2
        menuAvatarImage.clipsToBounds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var LogOutButton: UIButton!
    @IBAction func logOutButton(_ sender: Any) {
        
    }
    


}
