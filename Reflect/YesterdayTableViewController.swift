//
//  YesterdayTableViewController.swift
//  Reflect
//
//  Created by Enrique Torrendell on 1/19/17.
//  Copyright © 2017 Enrique Torrendell. All rights reserved.
//

import UIKit
import Firebase

class YesterdayTableViewController: UITableViewController {
    
    
    
    let store = DataStore.sharedInstance
    let database = FIRDatabase.database().reference()
    var habits: [Habit] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
        
        // MARK: - Table view data source
    }
    
    func commonInit() {
        
        
      
        
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return habits.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "yesterdayCell", for: indexPath) as! YesterdayTableViewCell
        
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        
        let habit = habits[indexPath.row]
        
        let dailyData = self.database.child("daily").child(store.yesterdayDate).child(store.user.id).child(habit.id)
        
        // update daily list
        
        dailyData.observe(.value, with: { (snapshot) in
            
            let dailyRoot = snapshot.value as? [String:Any]
            
            let habitRank = dailyRoot?["rank"] as? String
            
            let imageNumber = "circle\(habitRank!)"
            
            cell.reflectButton.setImage(UIImage(named: imageNumber), for: .normal)
            
        })
        
        cell.habits = habits
        
        
        
        return cell
    }

    /*
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
     
     // Configure the cell...
     
     return cell
     }
     */
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
