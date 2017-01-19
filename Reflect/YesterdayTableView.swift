//
//  YesterdayTableView.swift
//  Reflect
//
//  Created by Enrique Torrendell on 1/19/17.
//  Copyright © 2017 Enrique Torrendell. All rights reserved.
//

import UIKit
import Firebase

class YesterdayTableView: UITableView, UITableViewDelegate, UITableViewDataSource {


    var habits: [Habit] = []
    let store = DataStore.sharedInstance
    let database = FIRDatabase.database().reference()
    let reflectButton = UIButton()

    //MARK: - Loads
    init() {
        super.init(frame: CGRect.zero, style: UITableViewStyle.plain)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    init(frame: CGRect) {
        super.init(frame: frame, style: UITableViewStyle.plain)
        commonInit()
    }
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        commonInit()
    }
    
    
    
    func commonInit() {
        
       self.translatesAutoresizingMaskIntoConstraints = false
        
        self.delegate = self
        self.dataSource = self
        
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return habits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "yesterdayCell", for: indexPath) as! YesterdayTableViewCell
        
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        
        let habit = habits[indexPath.row]
        
        let dailyData = self.database.child("daily").child(store.currentDate).child(store.user.id).child(habit.id)
        
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
    
}
