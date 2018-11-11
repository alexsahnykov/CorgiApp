//
//  AticlesTableViewController.swift
//  Corgi App
//
//  Created by Александр Сахнюков on 05/11/2018.
//  Copyright © 2018 Александр Сахнюков. All rights reserved.
//

import UIKit
import Firebase

class AticlesTableViewController: UITableViewController {
    var aticle:Article?
    var storagePath:String = ""
    var aticles:[Article] = []
    let db = Firestore.firestore()

    let loadingView = UIView()
    let spinner = UIActivityIndicatorView()
    let loadingLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customisationNavigationBar(title: storagePath)
        
        setLoadingScreen()
        fetchData ()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
   
     
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ArcticleTableViewCell
        let cellItem = aticles[indexPath.row]
        cell.aticle = cellItem
        cell.title.text = cellItem.title
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let filmForSegue = aticles[indexPath.row]
        self.aticle = filmForSegue
        performSegue(withIdentifier: "articleSegue", sender: self)
    }
   
    
    
    // MARK: - Segue
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "articleSegue" {
            let dvc = segue.destination as! AticleDetailViewController
            dvc.article = self.aticle
            
        }
    }
    
    // MARK: - UI
    

    private func removeLoadingScreen() {
        
        // Hides and stops the text and the spinner
        spinner.stopAnimating()
        spinner.isHidden = true
        loadingLabel.isHidden = true
        
    }
    private func setLoadingScreen() {
        self.tableView.separatorColor = .mainWhite
        // Sets the view which contains the loading text and the spinner
        let width: CGFloat = 120
        let height: CGFloat = 30
        let x = (tableView.frame.width / 2) - (width / 2)
        let y = (tableView.frame.height / 2) - (height / 2) - (navigationController?.navigationBar.frame.height)!
        loadingView.frame = CGRect(x: x, y: y, width: width, height: height)
        
        // Sets loading text
        loadingLabel.textColor = .gray
        loadingLabel.textAlignment = .center
        loadingLabel.text = "Загрузка..."
        loadingLabel.frame = CGRect(x: 0, y: 0, width: 140, height: 30)
        
        // Sets spinner
        spinner.style = .gray
        spinner.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        spinner.startAnimating()
        
        // Adds text and spinner to the view
        loadingView.addSubview(spinner)
        loadingView.addSubview(loadingLabel)
        
        tableView.addSubview(loadingView)
        
    }
    
    // MARK: - fetchData
    
    func fetchData (){
        db.fetchArticles(storagePath: self.storagePath) { (atriclesFetched) in
            self.aticles = atriclesFetched
            self.tableView.reloadData()
            self.removeLoadingScreen()
            self.tableView.separatorColor = .colorLine
        }
        }
    
   
    }

