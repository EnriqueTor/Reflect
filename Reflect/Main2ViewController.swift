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
    @IBOutlet weak var headView: UIView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var footView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    //MARK: - Variables
    
    let store = DataStore.sharedInstance
    let database = FIRDatabase.database().reference()
    var scrollWidth = CGFloat()
    var scrollHeight = CGFloat()
    
    //MARK: - Loads
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        
        store.currentDate = getDate(date: Date().today)
        store.yesterdayDate = getDate(date: Date().yesterday)
        
        configDatabase()
        
        todayTableView.reloadData()
        yesterdayTableView.reloadData()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        //        setupView()

        configDatabase()
        todayTableView.reloadData()
        yesterdayTableView.reloadData()
    }
    
    //MARK: - Actions
    
    //MARK: - Methods
    
    func setupView() {
        
        todayTableView.delegate = self
        todayTableView.dataSource = self
        
        yesterdayTableView.delegate = self
        yesterdayTableView.dataSource = self
        
//        footView.backgroundColor = Constants.Color.darkGray
        
        
        
        dateLabel.text = "today"
        dateLabel.textColor = UIColor.white
        dateLabel.font = Constants.Font.button
        
        scrollWidth = scrollView.frame.width
        scrollHeight = scrollView.frame.height
        
        scrollView.delegate = self
        
        scrollView?.contentSize = CGSize(width: (scrollWidth * 4), height: scrollHeight)
        scrollView.scrollRectToVisible(CGRect( x: scrollWidth * 2, y: 0, width: scrollWidth, height: scrollHeight), animated: true)
        
        if pageControl.currentPage == 0 {
            dateLabel.text = "Settings"
            
        } else if pageControl.currentPage == 1 {
            dateLabel.text = "Yesterday"
            
        } else if pageControl.currentPage == 2 {
            dateLabel.text = "Today"
            
        } else if pageControl.currentPage == 3 {
            dateLabel.text = "Calendar"
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView == todayTableView {
            return store.todayHabits.count
        }
        
        if tableView == yesterdayTableView {
            return store.yesterdayHabits.count
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == todayTableView {
            
            let todayCell = todayTableView.dequeueReusableCell(withIdentifier: "habitCell", for: indexPath) as! HabitTableViewCell
            
            todayCell.selectionStyle = UITableViewCellSelectionStyle.none
            todayCell.cellView.layer.cornerRadius = 3
            
            
            
            let todayHabit = store.todayHabits[indexPath.row]
            
            todayCell.habitLabel.text = todayHabit.name
            
            if todayHabit.startDate == store.currentDate {
                todayCell.newHabitLabel.text = "New"
            }
            else {
                todayCell.newHabitLabel.text = ""
            }
            
            let habitRank = todayHabit.date[store.currentDate]
            
            let imageNumber = "circle\(habitRank!)"
            
            todayCell.reflectButton.setImage(UIImage(named: imageNumber), for: .normal)
            
            todayCell.habits = store.todayHabits
            
            return todayCell
            
        }
        
        if tableView == yesterdayTableView {
            
            let yesterdayCell = yesterdayTableView.dequeueReusableCell(withIdentifier: "yesterdayCell", for: indexPath) as! YesterdayTableViewCell
            
            yesterdayCell.selectionStyle = UITableViewCellSelectionStyle.none
            yesterdayCell.cellView.layer.cornerRadius = 3

            let yesterdayHabit = store.yesterdayHabits[indexPath.row]
            
            yesterdayCell.habitLabel.text = yesterdayHabit.name
            
            let habitRank = yesterdayHabit.date[store.yesterdayDate]
            
            let imageNumber = "circle\(habitRank!)"
            
            yesterdayCell.reflectButton.setImage(UIImage(named: imageNumber), for: .normal)
            
            yesterdayCell.habits = store.yesterdayHabits
            
            return yesterdayCell
        }
        
        return todayTableView.dequeueReusableCell(withIdentifier: "habitCell")!
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let delete = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in
            
            let alertController = UIAlertController(title: "Delete",  message: "Are you sure you want to delete this task?.", preferredStyle: .alert)
            
            let deleteAction = UIAlertAction(title: "Delete", style: .default, handler: { action -> Void in
                
                let habitID = self.store.todayHabits[indexPath.row].id
                
                self.store.todayHabits.remove(at: indexPath.row)
                
                self.todayTableView.deleteRows(at: [indexPath], with: .fade)
                
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
        
        let habitData = database.child("habit").child(store.user.id)
        
        store.habits = []
        store.yesterdayHabits = []
        
        habitData.observe(.value, with: { snapshot in
            
            var newHabits = [Habit]()
            
            for item in snapshot.children {
                
                let newHabit = Habit(snapshot: (item as? FIRDataSnapshot)!)
                
                newHabits.insert(newHabit, at: 0)
                
            }
            self.store.habits = newHabits
            self.fillTodayAndYesterday()
            self.fillToday(date: self.store.currentDate)
            self.fillyesterday(date: self.store.yesterdayDate)
            self.todayTableView.reloadData()
            self.yesterdayTableView.reloadData()
            
        })
        
    }
    
    override func motionBegan(_ motion: UIEventSubtype, with event: UIEvent?) {
        performSegue(withIdentifier: "addHabit", sender: nil)
    }
    
    func fillToday(date: String) {
        
        store.todayHabits = []
        
        for habit in store.habits {
            
            var habitDate = habit.date
            
            if habitDate[date]?.isEmpty == false {
                
                store.todayHabits.insert(habit, at: 0)
            }
        }
    }
    
    func fillyesterday(date: String) {
        
        store.yesterdayHabits = []
        
        for habit in store.habits {
            
            var habitDate = habit.date
            
            if habitDate[date]?.isEmpty == false {
                
                store.yesterdayHabits.insert(habit, at: 0)
            }
        }
    }
    
    func fillTodayAndYesterday() {
        
        for habit in store.habits { 
            
            var habitDate = habit.date
            
            if habitDate[store.currentDate] == nil {
                
                database.child("habit").child(self.store.user.id).child(habit.id).child("date").child(store.currentDate).setValue("0")
            }
            
            if habitDate[store.yesterdayDate] == nil {
                
                database.child("habit").child(self.store.user.id).child(habit.id).child("date").child(store.yesterdayDate).setValue("0")
            }
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
            dateLabel.text = "Settings"
        }
        else if page == 1 {
            dateLabel.text = "Yesterday"
        }
        else if page == 2 {
            dateLabel.text = "Today"
        }
        else if page == 3 {
            dateLabel.text = "Calendar"
        }
    }
    
    
}
