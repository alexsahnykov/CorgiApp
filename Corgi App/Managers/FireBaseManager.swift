//
//  FireBaseManager.swift
//  Corgi App
//
//  Created by Александр Сахнюков on 05/11/2018.
//  Copyright © 2018 Александр Сахнюков. All rights reserved.
//


import Foundation
import Firebase

extension Auth {
    
    func createUser(withEmail email: String, username: String, password: String, completion: @escaping (Error?) -> ()) {
        Auth.auth().createUser(withEmail: email, password: password, completion: { (user, err) in 
            if let err = err {
                print("Failed to create user:", (err as NSError).code  )
                completion(err)
                return
            }
            guard let uid = user?.user.uid else { return }
            self.uploadUser(withUID: uid, username: username) {
                completion(nil)
                
            }
        })
        
    }
   
    private func uploadUser(withUID uid: String, username: String, completion: @escaping (() -> ())) {
        let dictionaryValues = ["username": username]
        let values = [uid: dictionaryValues]
        Database.database().reference().child("users").updateChildValues(values, withCompletionBlock: { (err, ref) in
            if let err = err {
                print("Failed to upload user to database:", err)
                return
            }
            completion()
        })
    }
}

extension Firestore {
    
    func fetchArticles (storagePath: String, completion: @escaping (_ atriclesFetched: [Article])->()) {
        var articles: [Article] = []
        let storageRef = Firestore.firestore()
        storageRef.collection(storagePath).getDocuments { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents where document.data()["title"] != nil{
                    let article = Article(title: document.data()["title"] as! String,
                                          text: document.data()["text"] as! String,
                                          id: document.data()["id"] as! Int,
                                          imageUrl:document.data()["imageUrl"] as! String,
                                          creationDate: document.data()["date"] as! Date,
                                          review: document.data()["review"] as? String)
                    articles.append(article)}
                completion(articles)
            }
        }
    }
}

extension Storage {
    func downloadImage (imageURl: String, completion: @escaping (UIImage) -> ()) {
        let pathReference = Storage.storage().reference(forURL: imageURl)
        pathReference.getData(maxSize: (1 * 1024 * 1024)) { (data, error) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                let image = UIImage(data: data!)
                completion(image!)
                
            }
        }
        
    }
}
