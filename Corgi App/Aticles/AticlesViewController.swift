//
//  ViewController.swift
//  Corgi App
//
//  Created by Александр Сахнюков on 02/11/2018.
//  Copyright © 2018 Александр Сахнюков. All rights reserved.
//

import UIKit
import Foundation
import Firebase

class AticlesViewController: UIViewController {
    var storagePath:String = ""
    var menuVc : LogInMenuViewController!
    
    @IBOutlet weak var wallsButton: UIButton!
    @IBOutlet weak var HealthButton: UIButton!
    @IBOutlet weak var FitButton: UIButton!
    @IBOutlet weak var DietButton: UIButton!
    @IBOutlet weak var ChoseButton: UIButton!
    
    @IBAction func wallsButton(_ sender: Any) {
        buttonPressed(storage: "Прогулки")
    }
    @IBAction func healthButton(_ sender: Any) {
        buttonPressed(storage: "Здоровье")
    }
    @IBAction func fitButton(_ sender: Any) {
        buttonPressed(storage: "Дрессировка")
    }
    @IBAction func dietButton(_ sender: Any) {
        buttonPressed(storage: "Питание")
    }
    @IBAction func choseButton(_ sender: Any) {
        buttonPressed(storage: "Выбор щенка")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuVc = self.storyboard?.instantiateViewController(withIdentifier: "LogInMenuViewController") as? LogInMenuViewController

        customisationNavigationBar(title: "Статьи")
        menuVc.facade(Vc: self)
    
    }
    override func viewWillAppear(_ animated: Bool) {

    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "articleGroupSegue" {
            let dvc = segue.destination as! AticlesTableViewController
            dvc.storagePath = self.storagePath
        }
    }
    
    
    func  buttonPressed (storage:String) {
        self.storagePath = storage
        performSegue(withIdentifier: "articleGroupSegue", sender: self)
        
    }
}

