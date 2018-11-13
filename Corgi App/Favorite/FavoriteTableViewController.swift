//
//  FavoriteTableViewController.swift
//  Corgi App
//
//  Created by Александр Сахнюков on 10/11/2018.
//  Copyright © 2018 Александр Сахнюков. All rights reserved.
//

import UIKit
import CoreData

class FavoriteTableViewController: UITableViewController {
    var aticles = [ArticleCoreData]()
    var menuVc : LogInMenuViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customisationNavigationBar(title: "Избраное")
        menuVc = self.storyboard?.instantiateViewController(withIdentifier: "LogInMenuViewController") as? LogInMenuViewController
        menuVc.facade(Vc: self)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let appDelagate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelagate.persistentContainer.viewContext
        let fetchRequest:NSFetchRequest<ArticleCoreData> = ArticleCoreData.fetchRequest()
        do {
            aticles = try context.fetch(fetchRequest)
            print ("Nice")
        }
        catch {
            print(error.localizedDescription)
        }
        self.tableView.reloadData()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return aticles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favoriteCell", for: indexPath) // as! ArcticleTableViewCell
        let cellItem = aticles[indexPath.row]
        cell.textLabel?.text = cellItem.title
       
        
        return cell
    }
    
}
