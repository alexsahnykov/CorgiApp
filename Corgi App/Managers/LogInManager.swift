//
//  File.swift
//  Corgi App
//
//  Created by Александр Сахнюков on 12/09/2018.
//  Copyright © 2018 Александр Сахнюков. All rights reserved.
//

import Foundation
import  FirebaseAuth
class registration {
    
    let mailLogIn: String
    let passLogIn: String
    
    
    func login () {
        let queue = DispatchQueue.global(qos: .utility)
        queue.async {
            Auth.auth().signIn(withEmail: self.mailLogIn, password: self.passLogIn) { (user, error) in
                if error != nil {
                    print((error?.localizedDescription)!)
                    return
                }
                if user != nil {
                    DispatchQueue.main.async {
                        return
                    }
                }
            }
        }
        guard Auth.auth().currentUser != nil else {
            print("Сасай лах")
            return}
        
        print ("Жопа \(String(describing: Auth.auth().currentUser))")
    }
    init(mailLogIn: String, passLogIn: String) {
        self.mailLogIn = mailLogIn
        self.passLogIn = passLogIn
    }
}
