//
//  Main2ViewController.swift
//  Reflect
//
//  Created by Enrique Torrendell on 1/12/17.
//  Copyright © 2017 Enrique Torrendell. All rights reserved.
//

import UIKit
import Firebase

class Main2ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    let store = DataStore.sharedInstance
    let database = FIRDatabase.database().reference()
    
    var habits: [Habit] = []
       
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        configDatabase()

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setupView()
        configDatabase()

    }
    
    func setupView() {
        
        tableView.delegate = self
        tableView.dataSource = self

    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return habits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "habitCell", for: indexPath) as! HabitTableViewCell
        
        cell.selectionStyle = UITableViewCellSelectionStyle.none

        cell.habitLabel.text = habits[indexPath.row].name
        
        let imageNumber = "circle\(habits[indexPath.row].archive)"
        
        cell.reflectButton.setImage(UIImage(named: imageNumber), for: .normal)
        
        cell.cellView.layer.cornerRadius = 3
        
        return cell
    }
    
    @IBAction func dismissVC(_ sender: UIButton) {
        UserDefaults.standard.setValue(nil, forKey: "email")
        NotificationCenter.default.post(name: NSNotification.Name.openWelcomeVC, object: nil)
        
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let delete = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in
            
            let alertController = UIAlertController(title: "Delete",  message: "Are you sure you want to delete this task?.", preferredStyle: .alert)
            
            let deleteAction = UIAlertAction(title: "Delete", style: .default, handler: { action -> Void in
  
                self.store.userHabits.remove(at: indexPath.row)
                self.habits.remove(at: indexPath.row)
                
                tableView.deleteRows(at: [indexPath], with: .fade)
                
                self.database.child("habit").child(self.store.user.id).child(self.habits[indexPath.row].id).removeValue()
                
                self.tableView.reloadData()
            })
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: { action in
           
            })
            
            
            alertController.addAction(deleteAction)
            alertController.addAction(cancelAction)
            
            self.present(alertController, animated: true, completion: nil)
        }
        
        
        return [delete]
    }

    func configDatabase() {
        
        let habitData = database.child("habit").child(store.user.id)
        
        habitData.observe(.value, with: { snapshot in
            
            print("====> this is the snapshot \(snapshot)")
            var newHabits: [Habit] = []
            
            print(snapshot.children)
            
            for item in snapshot.children {
                
                let newHabit = Habit(snapshot: (item as? FIRDataSnapshot)!)
                
                newHabits.append(newHabit)
            }
            
            self.store.userHabits = newHabits
            self.habits = self.store.userHabits
            self.tableView.reloadData()
            
        })
    }
    
    

}
