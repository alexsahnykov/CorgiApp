//
//  Extension.swift
//  Corgi App
//
//  Created by Александр Сахнюков on 11/09/2018.
//  Copyright © 2018 Александр Сахнюков. All rights reserved.
//

import Foundation
import UIKit

extension RegistrationViewController
{
    func hideKeyboard()
    {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(RegistrationViewController.dismissKeyboard))
        
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard()
    {
        view.endEditing(true)
    }
}
