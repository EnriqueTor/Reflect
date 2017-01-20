//
//  HabitCollectionViewCell.swift
//  Reflect
//
//  Created by Enrique Torrendell on 1/12/17.
//  Copyright © 2017 Enrique Torrendell. All rights reserved.
//

import UIKit
import Firebase

class HabitTableViewCell: UITableViewCell {
    
    @IBOutlet weak var habitLabel: UILabel!
    @IBOutlet weak var cellMainView: UIView!
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var reflectButton: UIButton!
    @IBOutlet weak var reflectView: UIView!
    
    let circle1 = UIButton()
    let circle2 = UIButton()
    let circle3 = UIButton()
    let circle4 = UIButton()
    let circle5 = UIButton()
    let store = DataStore.sharedInstance
    let database = FIRDatabase.database().reference()
    var habits: [Habit] = []
    
    @IBAction func rankPushed(_ sender: UIButton) {
        
        print("jksfhasfhkhsdhk")
        //        //MARK: reflectView
        //        reflectView.translatesAutoresizingMaskIntoConstraints = false
        //        cellMainView.addSubview(reflectView)
        //        reflectView.centerXAnchor.constraint(equalTo: cellMainView.centerXAnchor).isActive = true
        //        reflectView.bottomAnchor.constraint(equalTo: cellMainView.bottomAnchor).isActive = true
        //        reflectView.widthAnchor.constraint(equalTo: cellMainView.widthAnchor).isActive = true
        //        reflectView.heightAnchor.constraint(equalToConstant: 78).isActive = true
        //        reflectView.backgroundColor = UIColor.white
        //
        
        //MARK: circle3
        circle3.translatesAutoresizingMaskIntoConstraints = false
        reflectView.addSubview(circle3)
        circle3.heightAnchor.constraint(equalToConstant: 50).isActive = true
        circle3.widthAnchor.constraint(equalToConstant: 50).isActive = true
        circle3.centerXAnchor.constraint(equalTo: reflectView.centerXAnchor).isActive = true
        circle3.centerYAnchor.constraint(equalTo: reflectView.centerYAnchor).isActive = true
        circle3.setImage(Constants.Images.circle3, for: .normal)
        circle3.addTarget(self, action:  #selector(rankSelected3), for: .touchUpInside)
        circle3.alpha = 0
        
        //MARK: circle2
        circle2.translatesAutoresizingMaskIntoConstraints = false
        reflectView.addSubview(circle2)
        circle2.heightAnchor.constraint(equalToConstant: 50).isActive = true
        circle2.widthAnchor.constraint(equalToConstant: 50).isActive = true
        circle2.trailingAnchor.constraint(equalTo: circle3.leadingAnchor, constant: -10).isActive = true
        circle2.centerYAnchor.constraint(equalTo: reflectView.centerYAnchor).isActive = true
        circle2.setImage(Constants.Images.circle2, for: .normal)
        circle2.addTarget(self, action:  #selector(rankSelected2), for: .touchUpInside)
        circle2.alpha = 0
        
        //MARK: circle1
        circle1.translatesAutoresizingMaskIntoConstraints = false
        reflectView.addSubview(circle1)
        circle1.heightAnchor.constraint(equalToConstant: 50).isActive = true
        circle1.widthAnchor.constraint(equalToConstant: 50).isActive = true
        circle1.trailingAnchor.constraint(equalTo: circle2.leadingAnchor, constant: -10).isActive = true
        circle1.centerYAnchor.constraint(equalTo: reflectView.centerYAnchor).isActive = true
        circle1.setImage(Constants.Images.circle1, for: .normal)
        circle1.addTarget(self, action:  #selector(rankSelected1), for: .touchUpInside)
                circle1.alpha = 0
        
        //MARK: circle4
        circle4.translatesAutoresizingMaskIntoConstraints = false
        reflectView.addSubview(circle4)
        circle4.heightAnchor.constraint(equalToConstant: 50).isActive = true
        circle4.widthAnchor.constraint(equalToConstant: 50).isActive = true
        circle4.leadingAnchor.constraint(equalTo: circle3.trailingAnchor, constant: 10).isActive = true
        circle4.centerYAnchor.constraint(equalTo: reflectView.centerYAnchor).isActive = true
        circle4.setImage(Constants.Images.circle4, for: .normal)
        circle4.addTarget(self, action:  #selector(rankSelected4), for: .touchUpInside)
                circle4.alpha = 0
        
        //MARK: circle5
        circle5.translatesAutoresizingMaskIntoConstraints = false
        reflectView.addSubview(circle5)
        circle5.heightAnchor.constraint(equalToConstant: 50).isActive = true
        circle5.widthAnchor.constraint(equalToConstant: 50).isActive = true
        circle5.leadingAnchor.constraint(equalTo: circle4.trailingAnchor, constant: 10).isActive = true
        circle5.centerYAnchor.constraint(equalTo: reflectView.centerYAnchor).isActive = true
        circle5.setImage(Constants.Images.circle5, for: .normal)
        circle5.addTarget(self, action:  #selector(rankSelected5), for: .touchUpInside)
        circle5.alpha = 0
        
        UIView.animate(withDuration: 0.3, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.2, options: .curveEaseOut, animations: {            self.reflectView.alpha = 1
            self.circle1.alpha = 1
            self.circle2.alpha = 1
            self.circle3.alpha = 1
            self.circle4.alpha = 1
            self.circle5.alpha = 1
        })
        
    }
    
    func rankSelected1() {
        
        reflectButton.setImage(UIImage(named: "circle1"), for: .normal)
        
        let indexPath :NSIndexPath = (self.superview!.superview as! UITableView).indexPath(for: self)! as NSIndexPath
        
        let habit = habits[indexPath.row]
        
        database.child("habit").child(store.user.id).child(habit.id).child("date").child(store.currentDate).setValue("1")
        
        hideRank()
        
    }
    
    func rankSelected2() {
        
        reflectButton.setImage(UIImage(named: "circle2"), for: .normal)
        
        let indexPath :NSIndexPath = (self.superview!.superview as! UITableView).indexPath(for: self)! as NSIndexPath
        
        let habit = habits[indexPath.row]
        
        database.child("habit").child(store.user.id).child(habit.id).child("date").child(store.currentDate).setValue("2")
        
        hideRank()
    }
    
    func rankSelected3() {
        
        reflectButton.setImage(UIImage(named: "circle3"), for: .normal)
        
        let indexPath :NSIndexPath = (self.superview!.superview as! UITableView).indexPath(for: self)! as NSIndexPath
        
        let habit = habits[indexPath.row]
        
        database.child("habit").child(store.user.id).child(habit.id).child("date").child(store.currentDate).setValue("3")
        
        hideRank()
    }
    
    func rankSelected4() {
        
        reflectButton.setImage(UIImage(named: "circle4"), for: .normal)
        
        let indexPath :NSIndexPath = (self.superview!.superview as! UITableView).indexPath(for: self)! as NSIndexPath
        
        let habit = habits[indexPath.row]
        
        database.child("habit").child(store.user.id).child(habit.id).child("date").child(store.currentDate).setValue("4")
        
        hideRank()
    }
    
    func rankSelected5() {
        
        reflectButton.setImage(UIImage(named: "circle5"), for: .normal)
        
        let indexPath :NSIndexPath = (self.superview!.superview as! UITableView).indexPath(for: self)! as NSIndexPath
        
        let habit = habits[indexPath.row]
        
        database.child("habit").child(store.user.id).child(habit.id).child("date").child(store.currentDate).setValue("5")
        
        hideRank()
    }
    
    func hideRank() {
        
        UIView.animate(withDuration: 0.30, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.2, options: .curveLinear, animations: {
            self.reflectView.alpha = 0
            self.circle1.alpha = 0
            self.circle2.alpha = 0
            self.circle3.alpha = 0
            self.circle4.alpha = 0
            self.circle5.alpha = 0
        })
    }
    
    
}
