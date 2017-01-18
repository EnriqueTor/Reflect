//
//  AddHabitViewController.swift
//  Reflect
//
//  Created by Enrique Torrendell on 1/13/17.
//  Copyright © 2017 Enrique Torrendell. All rights reserved.
//

import UIKit
import Firebase

class AddHabitViewController: UIViewController, UITextFieldDelegate {
    
    let backgroundView = UIView()
    let addHabitView = UIView()
    let titleLabel = UILabel()
    let errorLabel = UILabel()
    let subtitleLabel = UILabel()
    let habitText = UITextField()
    let saveButton = UIButton()
    let cancelButton = UIButton()
    let database = FIRDatabase.database().reference()
    let store = DataStore.sharedInstance
    
    //MARK: - Loads
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    //MARK: - Functions
    func setupView() {
        
        let tapDismiss = UITapGestureRecognizer(target: self, action: #selector(LoginViewController.dismissVC))

        view.backgroundColor = UIColor.clear
        
        //MARK: backgroundView
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backgroundView)
        backgroundView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        backgroundView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        backgroundView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        backgroundView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        backgroundView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        backgroundView.addGestureRecognizer(tapDismiss)
        
        
        //MARK: addHabitView
        addHabitView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(addHabitView)
        addHabitView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        addHabitView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        addHabitView.heightAnchor.constraint(equalToConstant: 220).isActive = true
        addHabitView.widthAnchor.constraint(equalToConstant: 280).isActive = true
        addHabitView.backgroundColor = UIColor.white
        addHabitView.layer.cornerRadius = 3
        
        //MARK: titleLabel
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        addHabitView.addSubview(titleLabel)
        titleLabel.centerXAnchor.constraint(equalTo: addHabitView.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: addHabitView.topAnchor, constant: 25).isActive = true
        titleLabel.text = "Add habit to"
        titleLabel.font = Constants.Font.title
        
        //MARK: subtitleLabel
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        addHabitView.addSubview(subtitleLabel)
        subtitleLabel.centerXAnchor.constraint(equalTo: addHabitView.centerXAnchor).isActive = true
        subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 3).isActive = true
        subtitleLabel.text = "Reflect"
        subtitleLabel.font = Constants.Font.subtitle
        
        //MARK: saveButton
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        addHabitView.addSubview(saveButton)
        saveButton.centerXAnchor.constraint(equalTo: addHabitView.centerXAnchor).isActive = true
        saveButton.bottomAnchor.constraint(equalTo: addHabitView.bottomAnchor, constant: -15).isActive = true
        saveButton.trailingAnchor.constraint(equalTo: addHabitView.trailingAnchor, constant: -15).isActive = true
        saveButton.leadingAnchor.constraint(equalTo: addHabitView.leadingAnchor, constant: 15).isActive = true
        saveButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        saveButton.isUserInteractionEnabled = true
        saveButton.backgroundColor = Constants.Color.orangeCool
        saveButton.setTitle("Save", for: .normal)
        saveButton.titleLabel?.font = Constants.Font.button
        saveButton.titleLabel?.textColor = UIColor.white
        saveButton.layer.cornerRadius = 3
        saveButton.addTarget(self, action: #selector(AddHabitViewController.savePushed), for: UIControlEvents.touchUpInside)
        
        //MARK: habitText
        habitText.translatesAutoresizingMaskIntoConstraints = false
        addHabitView.addSubview(habitText)
        habitText.centerXAnchor.constraint(equalTo: addHabitView.centerXAnchor).isActive = true
        habitText.bottomAnchor.constraint(equalTo: saveButton.topAnchor, constant: -15).isActive = true
        habitText.trailingAnchor.constraint(equalTo: addHabitView.trailingAnchor, constant: -15).isActive = true
        habitText.leadingAnchor.constraint(equalTo: addHabitView.leadingAnchor, constant: 15).isActive = true
        habitText.heightAnchor.constraint(equalToConstant: 44).isActive = true
        habitText.layer.borderWidth = 0
        habitText.background = UIImage(named: "input-outline")
        habitText.placeholder = "Habit"
        habitText.font = Constants.Font.button
        habitText.textColor = Constants.Color.orangeCool
        habitText.autocapitalizationType = .words
        habitText.autocapitalizationType = .none
        habitText.setLeftPaddingPoints(10)
        habitText.setRightPaddingPoints(10)
        habitText.autocorrectionType = .no
        habitText.delegate = self
        habitText.addTarget(self, action: #selector(AddHabitViewController.textFieldDidChange(sender:)), for: UIControlEvents.editingChanged)
        
        //MARK: errorLabel
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        addHabitView.addSubview(errorLabel)
        errorLabel.centerXAnchor.constraint(equalTo: addHabitView.centerXAnchor).isActive = true
        errorLabel.bottomAnchor.constraint(equalTo: habitText.topAnchor, constant: -5).isActive = true
        errorLabel.widthAnchor.constraint(equalTo: habitText.widthAnchor).isActive = true
        errorLabel.textColor = UIColor.red
        errorLabel.font = Constants.Font.small
        errorLabel.numberOfLines = 2
        errorLabel.textAlignment = .center
        
        
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        habitText.resignFirstResponder()
        return true
    }
    
    func textFieldDidChange(sender: UITextField) {
        textChanged(sender)
        changeBackgroundText(sender)
    }
    
    func textChanged(_ sender: UITextField) {
        
        if UIDevice.current.modelName == "iPhone 7" || UIDevice.current.modelName == "iPhone 6s" || UIDevice.current.modelName == "iPhone 6" {
            
            if (sender.text?.characters.count)! > 25 {
                saveButton.isEnabled = false
                errorLabel.text = "Habits can have 20 characters."
            }
            else {
                saveButton.isEnabled = true
                errorLabel.text = ""
            }
        }
        
        if UIDevice.current.modelName == "iPhone 7 Plus" || UIDevice.current.modelName == "iPhone 6s Plus" || UIDevice.current.modelName == "iPhone 6 Plus" {
            
            if (sender.text?.characters.count)! > 30 {
                saveButton.isEnabled = false
                errorLabel.text = "Habits can have 30 characters."
            }
            else {
                saveButton.isEnabled = true
                errorLabel.text = ""
            }
        }

        if UIDevice.current.modelName == "iPhone 4" || UIDevice.current.modelName == "iPhone 4s" || UIDevice.current.modelName == "iPhone 5" || UIDevice.current.modelName == "iPhone 5s" || UIDevice.current.modelName == "iPhone 5c"  || UIDevice.current.modelName == "iPhone SE" {
            
            if (sender.text?.characters.count)! > 20 {
                saveButton.isEnabled = false
                errorLabel.text = "Habits can have 20 characters."
            }
            else {
                saveButton.isEnabled = true
                errorLabel.text = ""
            }
        }
            
        else {
            
            if (sender.text?.characters.count)! > 25 {
                saveButton.isEnabled = false
                errorLabel.text = "Habits can have 25 characters."
            }
            else {
                saveButton.isEnabled = true
                errorLabel.text = ""
            }
        }
    }
    
    func changeBackgroundText(_ sender: UITextField) {
    
        if sender == habitText && sender.text != "" {
            habitText.background = UIImage(named: "input-outline-active")
        }
        else {
            habitText.background = UIImage(named: "input-outline")
        }
    }
    
    func dismissVC() {
        dismiss(animated: true, completion: nil)
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if touch.view!.isDescendant(of: addHabitView) {
            return false
        }
        return true
    }
    
    func savePushed() {
        
        guard let name = habitText.text, name != "" else { return }

        let dataHabit = database.child("habit").child(store.user.id).childByAutoId()
        store.habit.id = dataHabit.key
        
        let newHabit = Habit(id: store.habit.id, name: name, startDate: "", archive: "0")
        
        database.child("habit").child(store.user.id).child(store.habit.id).setValue(newHabit.serialize(), withCompletionBlock: { error, dataRef in
            
        
            
        })

        saveButton.isEnabled = false
        
        dismissVC()
    }

}
