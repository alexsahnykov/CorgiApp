//
//  RegistrationViewController.swift
//  Corgi App
//
//  Created by Александр Сахнюков on 11/09/2018.
//  Copyright © 2018 Александр Сахнюков. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class RegistrationViewController: UIViewController {
    let lockImage = UIImage(named: "LockIcon.png")
    let iconImage = UIImage(named: "iconImage.png")
    let mailImage = UIImage(named: "MailIcon.png")
    
    
    var ref: DatabaseReference!
    
  //  let userID = Auth.auth().currentUser!.uid
    
    
    
    let sizeIconImage = CGRect( x: 15.0, y: 3.0, width: 33, height: 33)
    let sizeMailImage = CGRect( x: 20.0, y: 11.5, width: 23, height: 18)
    let sizeLockImage = CGRect( x: 21, y: 6, width: 21, height: 26)
 
    
    @IBAction func back(_ sender: Any) {

        self.dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var iconTextField: UITextField!
    @IBOutlet weak var mailTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    
    @IBAction func registrationButton(_ sender: Any) {
        guard   let login    =  iconTextField.text, login != "",
                let mail     =  mailTextField.text, mail != "",
                let password =  passTextField.text,password != ""  else{
    CustomAlert.init(title: "Ошибка", subTitle: "Вы не заполнили все поля", color: 0xB50909).alertController()
    return
        }
    Auth.auth().createUser(withEmail: mail, username: login, password: password) { (err) in
            if err != nil {
               CustomAlert.init(title: "Ошибка", subTitle: (err?.localizedDescription)!, color: 0xB50909).alertController()
                return}
        self.dismiss(animated: true, completion: nil)
                    CustomAlert.init(title: "Успех", subTitle: "Вы успешно зарегестрировались!", color: 0x008000).alertController()
        }
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboard()
        addIcon(textField: iconTextField, image: iconImage!, size: sizeIconImage)
        addIcon(textField: mailTextField, image: mailImage!, size: sizeMailImage)
        addIcon(textField: passTextField, image: lockImage!, size: sizeLockImage)
       
        
      

    }

    

    func addIcon (textField : UITextField, image : UIImage, size:CGRect) {
        let leftImageView =  UIImageView (frame: size)
        let view = UIView (frame: CGRect(x: 0, y: 0, width: 60, height: 40))
        leftImageView.image = image
        view.addSubview(leftImageView)
        textField.leftView = view
        textField.leftViewMode = .always
        
    }
    
    
}



