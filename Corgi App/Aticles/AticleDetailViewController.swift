//
//  AticleDetailViewController.swift
//  Corgi App
//
//  Created by Александр Сахнюков on 05/11/2018.
//  Copyright © 2018 Александр Сахнюков. All rights reserved.
//

import UIKit
import Firebase
import CoreData

class AticleDetailViewController: UIViewController,UITextViewDelegate {
    var article: Article! = nil
    let storage = Storage.storage()
  
   

    
    
    @IBOutlet weak var titleArticle: UILabel!
    @IBOutlet weak var textArticle: UITextView!
    @IBOutlet weak var imagerticle: UIImageView!
    let spinner = UIActivityIndicatorView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .mainWhite
        titleArticle.text = article.title
        textArticle?.delegate = self
        customTextView()
        createFavoriteButtonInNavigationBar()
        downloadImage(imageView: imagerticle, spinner: spinner)
        
    }
    
    
    
    func downloadImage(imageView:UIImageView, spinner:UIActivityIndicatorView) {
        spinner.style = .gray
        spinner.frame = CGRect(x: imagerticle.frame.size.width/2, y: imagerticle.frame.size.height/2, width: 30, height: 30)
        spinner.startAnimating()
        imageView.addSubview(spinner)
        storage.downloadImage(imageURl: article.imageUrl) { (image) in
            imageView.image = image
            spinner.stopAnimating()
            spinner.isHidden = true
        }
    }
    
    func createFavoriteButtonInNavigationBar () {
        let favorite: UIBarButtonItem = {
        let button = UIBarButtonItem(image: UIImage(named: "favorite"), style: .done, target: self, action: #selector (menuButtonTabbed))
            return button}()
        self.navigationItem.rightBarButtonItem = favorite
    }
    
    @objc func menuButtonTabbed(){
        let appDelagate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelagate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "ArticleCoreData", in: context)
        let taskObject = NSManagedObject(entity: entity!, insertInto: context) as! ArticleCoreData
        print(self.article)
        taskObject.setValue(self.article.creationDate, forKey: "creationDate")
        taskObject.setValue(self.article.text, forKey: "text")
        taskObject.setValue(self.article.title, forKey: "title")
        taskObject.setValue(self.article.review, forKey: "review")

        print(taskObject)
  //      taskObject.image = self.imagerticle.image
        do {
            try context.save()
            print ("Nice")
        }
        catch {
            print(error.localizedDescription)
        }
    }
 
    
    func  customTextView(){
     textArticle.text = article.text.htmlToString
     textArticle?.delegate = self
     let fixwidth = textArticle?.frame.size.width
     let newSize:CGSize = textArticle!.sizeThatFits(CGSize(width: fixwidth!, height: CGFloat(MAXFLOAT)))
     var newFrame = textArticle!.frame
     newFrame.size = CGSize(width: CGFloat(fmaxf(Float(newSize.width), Float(fixwidth!))), height: newSize.height)
     textArticle.frame = newFrame
    }
    

    
}
