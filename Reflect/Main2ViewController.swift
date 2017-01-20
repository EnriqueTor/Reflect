//
//  Main2ViewController.swift
//  Reflect
//
//  Created by Enrique Torrendell on 1/12/17.
//  Copyright © 2017 Enrique Torrendell. All rights reserved.
//

import UIKit
import Firebase

class Main2ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
    
    //MAK: - Outlets
    
    @IBOutlet weak var todayTableView: UITableView!
    @IBOutlet weak var yesterdayTableView: UITableView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var footView: UIView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var headView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    //MARK: - Variables
    
    let store = DataStore.sharedInstance
    let database = FIRDatabase.database().reference()
    var currentDate: String = ""
//    var todayHabits: [Habit] = []
    var scrollWidth = CGFloat()
    var scrollHeight = CGFloat()
    
    //MARK: - Loads
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        
        store.currentDate = getDate(date: Date().today)
        store.yesterdayDate = getDate(date: Date().yesterday)
        
        currentDate = store.currentDate
        
        configDatabase()
        
        print("THIS IS VERY IMPORTANT!!!! 1")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setupView()
    }
    
    //MARK: - Actions
    
    @IBAction func dismissVC(_ sender: UIButton) {
        UserDefaults.standard.setValue(nil, forKey: "email")
        NotificationCenter.default.post(name: NSNotification.Name.openWelcomeVC, object: nil)
        
    }
    
    //MARK: - Methods
    
    func setupView() {

        todayTableView.delegate = self
        todayTableView.dataSource = self

        footView.backgroundColor = Constants.Color.darkGray
        
        dateLabel.text = "today"
        dateLabel.textColor = UIColor.white
        dateLabel.font = Constants.Font.button
        
        scrollWidth = scrollView.frame.width
        scrollHeight = scrollView.frame.height

        scrollView.delegate = self

        scrollView?.contentSize = CGSize(width: (scrollWidth * 3), height: scrollHeight)
        scrollView.scrollRectToVisible(CGRect( x: scrollWidth * 1, y: 0, width: scrollWidth, height: scrollHeight), animated: true)

        if pageControl.currentPage == 0 {
            dateLabel.text = "yesterday"
            
        } else if pageControl.currentPage == 1 {
            dateLabel.text = "today"
        
        } else if pageControl.currentPage == 2 {
            dateLabel.text = "calendar"
            
        }

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return store.todayHabits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "habitCell", for: indexPath) as! HabitTableViewCell
        
        print("THIS IS VERY IMPORTANT!!!! 1")
        
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        cell.cellView.layer.cornerRadius = 3

        let habit = store.todayHabits[indexPath.row]
        
        cell.habitLabel.text = habit.name
        
        print("THIS IS VERY IMPORTANT!!!! 2")
        
        let dailyData = self.database.child("habit").child(store.user.id).child(habit.id).child("date")
        
        print("THIS IS VERY IMPORTANT!!!! 3")
        
        // update daily list
        
        dailyData.observe(.value, with: { (snapshot) in
            
            let dailyRoot = snapshot.value as? [String:Any]
            
            
            let habitRank = dailyRoot?[self.store.currentDate] as? [String:Any]
            
            print("====================> \(habitRank)")
            
            if habitRank == nil {
                
                return
            }
            
            else {
            let imageNumber = "circle\(habitRank?["rank"]!)"
            
            cell.reflectButton.setImage(UIImage(named: imageNumber), for: .normal)
            }
        })
        
        cell.habits = store.todayHabits
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let delete = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in
            
            let alertController = UIAlertController(title: "Delete",  message: "Are you sure you want to delete this task?.", preferredStyle: .alert)
            
            let deleteAction = UIAlertAction(title: "Delete", style: .default, handler: { action -> Void in
                
                let habitID = self.store.todayHabits[indexPath.row].id
                
                self.store.todayHabits.remove(at: indexPath.row)
                
                tableView.deleteRows(at: [indexPath], with: .fade)
                
                self.database.child("habit").child(self.store.user.id).child(habitID).removeValue()
                
                self.todayTableView.reloadData()
                
                
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

        // update habit list
        
        let habitData = database.child("habit").child(store.user.id)
        
        print("==============> \(store.user.id)")
        
        store.todayHabits = []
        
        habitData.observe(.value, with: { snapshot in
            
            var newHabits: [Habit] = []
            
            for item in snapshot.children {
                
                let newHabit = Habit(snapshot: (item as? FIRDataSnapshot)!)
                
                newHabits.insert(newHabit, at: 0)
            }
            
            self.store.todayHabits = newHabits
            
            self.todayTableView.reloadData()
            
//            let dailyData = self.database.child("habit").child(self.store.user.id)
//            
//            // update daily list
//
//            dailyData.observe(.value, with: { (snapshot) in
//                print("============>>>>")
//                let isDate = snapshot.value as? [String:Any]
//                
            for habit in self.store.todayHabits {
                
                if habit.date[self.currentDate] == nil {
                    self.updateDailyDatabase()
                    print("I do not exits")
                }
                
                else {
                    print("I'm alive!!")
                    
                }
            }
            
            
//                
//                if isDate?[self.store.currentDate] == nil {
//                    self.updateDailyDatabase()
//                    print("I do not exits")
//                    
//                }
//                else {
//                    print("I'm alive!!")
//                }
//                
//            })
            
        })
    
    }
    
    func updateDailyDatabase() {
        
        for habit in store.todayHabits {
            database.child("habit").child(self.store.user.id).child(habit.id).child("date").child(currentDate).setValue("0")
    
        }
    }
    
    func getDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: date).uppercased()
    }
    
    
    
    @IBAction func changePage(){
        scrollView.scrollRectToVisible(CGRect( x: scrollWidth * CGFloat ((pageControl?.currentPage)!), y: 0, width: scrollWidth, height: scrollHeight), animated: true)
    }
    
    
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        setIndiactorForCurrentPage()
    }
    
    func setIndiactorForCurrentPage()  {
        
        let page = (scrollView.contentOffset.x)/scrollWidth
        pageControl?.currentPage = Int(page)
        
        if page == 0 {
            dateLabel.text = "yesterday"
        }
        else if page == 1 {
            dateLabel.text = "today"
        }
        else if page == 2 {
            dateLabel.text = "calendar"
        }
    }
    
}
