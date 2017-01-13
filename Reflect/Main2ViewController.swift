//
//  Main2ViewController.swift
//  Reflect
//
//  Created by Enrique Torrendell on 1/12/17.
//  Copyright © 2017 Enrique Torrendell. All rights reserved.
//

import UIKit

class Main2ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var habits: [String] = ["Hello","Eat more veggies", "Read", "Run"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    
        
    }
    
    func setupView() {
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return habits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "habitCell", for: indexPath) as! HabitTableViewCell
        
        cell.habitLabel.text = habits[indexPath.row]
        cell.cellView.layer.cornerRadius = 3
        
        return cell
    }
    
    
    
}
