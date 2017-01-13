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
    
    var habits: [Habit] = []
    
    var one = Habit(id: "1", name: "Run", startingTime: "", finishDate: "", archive: "3")
    
    var two = Habit(id: "2", name: "Read", startingTime: "", finishDate: "", archive: "1")
    
    var three = Habit(id: "3", name: "Eat healthy", startingTime: "", finishDate: "", archive: "2")
    
    var four = Habit(id: "4", name: "Play soccer", startingTime: "", finishDate: "", archive: "5")
    
    var five = Habit(id: "4", name: "Do the dishes", startingTime: "", finishDate: "", archive: "4")
    
    let reflectView = UIView()
    let circle1 = UIImageView()
    let circle2 = UIImageView()
    let circle3 = UIImageView()
    let circle4 = UIImageView()
    let circle5 = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        createTask()
        
        habits = [one, two, three, four, five]
        
    }
    
    func setupView() {
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
        
        //MARK: reflectView
        reflectView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(reflectView)
        reflectView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        reflectView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        reflectView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        reflectView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        
        //MARK: circle1
        
        
        
        //MARK: circle2
        
        
        
        //MARK: circle3
        
        
        
        //MARK: circle4
        
        
        
        //MARK: circle5
        
        
        
        
        
    }
    
    func createTask() {
        
        
        
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return habits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "habitCell", for: indexPath) as! HabitTableViewCell
        
        cell.habitLabel.text = habits[indexPath.row].name
        
        var imageNumber = "circle\(habits[indexPath.row].archive)"
        
        cell.reflectImage.image = UIImage(named: imageNumber)
        
        cell.cellView.layer.cornerRadius = 3
        
        return cell
    }
    
    
    
}
