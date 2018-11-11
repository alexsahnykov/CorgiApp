//
//  AticleModel.swift
//  Corgi App
//
//  Created by Александр Сахнюков on 05/11/2018.
//  Copyright © 2018 Александр Сахнюков. All rights reserved.
//

import Foundation

struct Article {
    var title:String
    var text: String
    var id: Int
    var imageUrl: String
    var review:String?
    let creationDate: Date
    
    init(title: String, text: String, id: Int, imageUrl:String,creationDate:Date, review:String? ) {
         self.title = title
         self.text = text
         self.id = id
         self.imageUrl = imageUrl
         self.creationDate = creationDate
         self.review = review
    }
    
}
