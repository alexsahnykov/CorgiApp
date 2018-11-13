//
//  CustomAlert.swift
//  Corgi App
//
//  Created by Александр Сахнюков on 12/09/2018.
//  Copyright © 2018 Александр Сахнюков. All rights reserved.
//

import Foundation
import SCLAlertView

class CustomAlert {
    

    let title:String
    let subTitle:String
    let color:UInt
    
    func alertController () {
        
        let appearance = SCLAlertView.SCLAppearance(
            kCircleIconHeight: 55.0, showCircularIcon: true
        )
        
        let alertView = SCLAlertView(appearance: appearance)
        let alertViewIcon = UIImage(named: "фото.png")
        alertView.showSuccess(self.title, subTitle: self.subTitle, closeButtonTitle: "Готово", colorStyle: self.color,  circleIconImage: alertViewIcon, animationStyle: .topToBottom)
        
        
    }
    init(title: String, subTitle: String, color:UInt ) {
        self.title = title
        self.subTitle = subTitle
        self.color = color
    }
    
}
