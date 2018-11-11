//
//  Extension.swift
//  Corgi App
//
//  Created by Александр Сахнюков on 11/09/2018.
//  Copyright © 2018 Александр Сахнюков. All rights reserved.
//

import Foundation
import UIKit

extension RegistrationViewController {
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

extension UIColor {

    static var mainWhite = UIColor.rgb(red: 254, green: 254, blue: 254)
    static var color4 = UIColor.rgb(red: 239, green: 233, blue: 231)
    static var colorBrown = UIColor.rgb(red: 61, green: 34, blue: 9)
    static var colorLine = UIColor.rgb(red: 114, green: 95, blue: 77)
    
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}

extension String {
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return NSAttributedString() }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return NSAttributedString()
        }
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
}

extension Date
{
    
    func dateToString(date:Date?) -> String {
        guard let date = date else {return "sadasdad"}
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MMM-yyyy"
        let myString = formatter.string(from: date)
        return myString
    }
}

extension UIViewController {
    func customisationNavigationBar(title: String) {
        self.navigationItem.title = title
        self.navigationController?.navigationBar.barTintColor = UIColor.color4
        self.navigationController?.navigationBar.tintColor = UIColor.colorBrown
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Helvetica", size: 18)!]
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.colorBrown.withAlphaComponent(0.8)]
    }


}
