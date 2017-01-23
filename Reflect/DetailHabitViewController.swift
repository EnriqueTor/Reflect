//
//  DetailHabitViewController.swift
//  Reflect
//
//  Created by Enrique Torrendell on 1/22/17.
//  Copyright © 2017 Enrique Torrendell. All rights reserved.
//

import UIKit
import Firebase

class DetailHabitViewController: UIViewController, UITextFieldDelegate, UIGestureRecognizerDelegate {

    
    //MARK: - Variables
    let loginView = UIView()
    let backgroundView = UIView()
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
//    let loginButton = UIButton()
    let database = FIRDatabase.database().reference()
    let store = DataStore.sharedInstance
    let myKeychainWrapper = KeychainWrapper()
    let mondayText = UILabel()
    let tuesdayText = UILabel()
    let wednesdayText = UILabel()
    let thursdayText = UILabel()
    let fridayText = UILabel()
    let saturdayText = UILabel()
    let sundayText = UILabel()
    let mondayRank = UIImageView()
    let tuesdayRank = UIImageView()
    let wednesdayRank = UIImageView()
    let thursdayRank = UIImageView()
    let fridayRank = UIImageView()
    let saturdayRank = UIImageView()
    let sundayRank = UIImageView()
    let closeView = UIImageView()
    
    
    
    //MARK: - Loads
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        subscribeToKeyboardNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
//        unsubscribeFromKeyboardNotifications()
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
        backgroundView.backgroundColor = Constants.Color.darkGray.withAlphaComponent(0.5)
        backgroundView.isUserInteractionEnabled = true
        
        //MARK: loginView
        loginView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.addSubview(loginView)
        loginView.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor).isActive = true
        loginView.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor).isActive = true
        loginView.heightAnchor.constraint(equalToConstant: 280).isActive = true
        loginView.widthAnchor.constraint(equalToConstant: 280).isActive = true
        loginView.backgroundColor = UIColor.white
        loginView.layer.cornerRadius = 3
        
        //MARK: closeView
        closeView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(closeView)
        closeView.centerXAnchor.constraint(equalTo: loginView.trailingAnchor).isActive = true
        closeView.centerYAnchor.constraint(equalTo: loginView.topAnchor).isActive = true
        closeView.image = Constants.Images.closeView
        closeView.heightAnchor.constraint(equalToConstant: 25).isActive = true
        closeView.widthAnchor.constraint(equalToConstant: 25).isActive = true
        closeView.isUserInteractionEnabled = true
        closeView.addGestureRecognizer(tapDismiss)

        
        //MARK: titleLabel
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        loginView.addSubview(titleLabel)
        titleLabel.centerXAnchor.constraint(equalTo: loginView.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: loginView.topAnchor, constant: 25).isActive = true
        titleLabel.text = "Started on: \(store.currentDate)"
        titleLabel.font = Constants.Font.small
        
        //MARK: subtitleLabel
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        loginView.addSubview(subtitleLabel)
        subtitleLabel.centerXAnchor.constraint(equalTo: loginView.centerXAnchor).isActive = true
        subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 3).isActive = true
        subtitleLabel.text = "Run"
        subtitleLabel.font = Constants.Font.subtitle
        
//        //MARK: loginButton
//        loginButton.translatesAutoresizingMaskIntoConstraints = false
//        loginView.addSubview(loginButton)
//        loginButton.centerXAnchor.constraint(equalTo: loginView.centerXAnchor).isActive = true
//        loginButton.bottomAnchor.constraint(equalTo: loginView.bottomAnchor, constant: -15).isActive = true
//        loginButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor, constant: -15).isActive = true
//        loginButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor, constant: 15).isActive = true
//        loginButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
//        loginButton.backgroundColor = Constants.Color.orangeCool
//        loginButton.setTitle("Archive", for: .normal)
//        loginButton.titleLabel?.font = Constants.Font.button
//        loginButton.titleLabel?.textColor = UIColor.white
//        loginButton.layer.cornerRadius = 3
//        loginButton.addTarget(self, action: #selector(LoginViewController.loginPushed), for: UIControlEvents.touchUpInside)
        
        let spacingRight: CGFloat  = 35
        let spacingLeft: CGFloat = -35
        let spacingLabelButton: CGFloat = -10
        
        //MARK: thursday
        thursdayText.translatesAutoresizingMaskIntoConstraints = false
        loginView.addSubview(thursdayText)
        thursdayText.bottomAnchor.constraint(equalTo: loginView.bottomAnchor, constant: -15).isActive = true
        thursdayText.centerXAnchor.constraint(equalTo: loginView.centerXAnchor).isActive = true
        thursdayText.text = "T"
        thursdayText.font = Constants.Font.small
        
        thursdayRank.translatesAutoresizingMaskIntoConstraints = false
        loginView.addSubview(thursdayRank)
        thursdayRank.bottomAnchor.constraint(equalTo: thursdayText.topAnchor, constant: spacingLabelButton).isActive = true
        thursdayRank.centerXAnchor.constraint(equalTo: thursdayText.centerXAnchor).isActive = true
        thursdayRank.image = Constants.Images.circle2
        thursdayRank.heightAnchor.constraint(equalToConstant: 30).isActive = true
        thursdayRank.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        //MARK: wednesday
        wednesdayText.translatesAutoresizingMaskIntoConstraints = false
        loginView.addSubview(wednesdayText)
        wednesdayText.bottomAnchor.constraint(equalTo: loginView.bottomAnchor, constant: -15).isActive = true
        wednesdayText.leadingAnchor.constraint(equalTo: thursdayText.leadingAnchor, constant: spacingLeft).isActive = true
        wednesdayText.text = "W"
        wednesdayText.font = Constants.Font.small
        
        wednesdayRank.translatesAutoresizingMaskIntoConstraints = false
        loginView.addSubview(wednesdayRank)
        wednesdayRank.bottomAnchor.constraint(equalTo: wednesdayText.topAnchor, constant: spacingLabelButton).isActive = true
        wednesdayRank.centerXAnchor.constraint(equalTo: wednesdayText.centerXAnchor).isActive = true
        wednesdayRank.image = Constants.Images.circle5
        wednesdayRank.heightAnchor.constraint(equalToConstant: 30).isActive = true
        wednesdayRank.widthAnchor.constraint(equalToConstant: 30).isActive = true

        //MARK: tuesday
        tuesdayText.translatesAutoresizingMaskIntoConstraints = false
        loginView.addSubview(tuesdayText)
        tuesdayText.bottomAnchor.constraint(equalTo: loginView.bottomAnchor, constant: -15).isActive = true
        tuesdayText.leadingAnchor.constraint(equalTo: wednesdayText.leadingAnchor, constant: spacingLeft).isActive = true
        tuesdayText.text = "T"
        tuesdayText.font = Constants.Font.small
        
        tuesdayRank.translatesAutoresizingMaskIntoConstraints = false
        loginView.addSubview(tuesdayRank)
        tuesdayRank.bottomAnchor.constraint(equalTo: tuesdayText.topAnchor, constant: spacingLabelButton).isActive = true
        tuesdayRank.centerXAnchor.constraint(equalTo: tuesdayText.centerXAnchor).isActive = true
        tuesdayRank.image = Constants.Images.circle2
        tuesdayRank.heightAnchor.constraint(equalToConstant: 30).isActive = true
        tuesdayRank.widthAnchor.constraint(equalToConstant: 30).isActive = true

        //MARK: monday
        mondayText.translatesAutoresizingMaskIntoConstraints = false
        loginView.addSubview(mondayText)
        mondayText.bottomAnchor.constraint(equalTo: loginView.bottomAnchor, constant: -15).isActive = true
        mondayText.leadingAnchor.constraint(equalTo: tuesdayText.leadingAnchor, constant: spacingLeft).isActive = true
        mondayText.text = "M"
        mondayText.font = Constants.Font.small
        
        mondayRank.translatesAutoresizingMaskIntoConstraints = false
        loginView.addSubview(mondayRank)
        mondayRank.bottomAnchor.constraint(equalTo: mondayText.topAnchor, constant: spacingLabelButton).isActive = true
        mondayRank.centerXAnchor.constraint(equalTo: mondayText.centerXAnchor).isActive = true
        mondayRank.image = Constants.Images.circle4
        mondayRank.heightAnchor.constraint(equalToConstant: 30).isActive = true
        mondayRank.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        //MARK: friday
        fridayText.translatesAutoresizingMaskIntoConstraints = false
        loginView.addSubview(fridayText)
        fridayText.bottomAnchor.constraint(equalTo: loginView.bottomAnchor, constant: -15).isActive = true
        fridayText.leadingAnchor.constraint(equalTo: thursdayText.leadingAnchor, constant: spacingRight).isActive = true
        fridayText.text = "F"
        fridayText.font = Constants.Font.small
        
        fridayRank.translatesAutoresizingMaskIntoConstraints = false
        loginView.addSubview(fridayRank)
        fridayRank.bottomAnchor.constraint(equalTo: fridayText.topAnchor, constant: spacingLabelButton).isActive = true
        fridayRank.centerXAnchor.constraint(equalTo: fridayText.centerXAnchor).isActive = true
        fridayRank.image = Constants.Images.circle4
        fridayRank.heightAnchor.constraint(equalToConstant: 30).isActive = true
        fridayRank.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        //MARK: saturday
        saturdayText.translatesAutoresizingMaskIntoConstraints = false
        loginView.addSubview(saturdayText)
        saturdayText.bottomAnchor.constraint(equalTo: loginView.bottomAnchor, constant: -15).isActive = true
        saturdayText.leadingAnchor.constraint(equalTo: fridayText.leadingAnchor, constant: spacingRight).isActive = true
        saturdayText.text = "S"
        saturdayText.font = Constants.Font.small
        
        saturdayRank.translatesAutoresizingMaskIntoConstraints = false
        loginView.addSubview(saturdayRank)
        saturdayRank.bottomAnchor.constraint(equalTo: saturdayText.topAnchor, constant: spacingLabelButton).isActive = true
        saturdayRank.centerXAnchor.constraint(equalTo: saturdayText.centerXAnchor).isActive = true
        saturdayRank.image = Constants.Images.circle1
        saturdayRank.heightAnchor.constraint(equalToConstant: 30).isActive = true
        saturdayRank.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        //MARK: sunday
        sundayText.translatesAutoresizingMaskIntoConstraints = false
        loginView.addSubview(sundayText)
        sundayText.bottomAnchor.constraint(equalTo: loginView.bottomAnchor, constant: -15).isActive = true
        sundayText.leadingAnchor.constraint(equalTo: saturdayText.leadingAnchor, constant: spacingRight).isActive = true
        sundayText.text = "S"
        sundayText.font = Constants.Font.small
        
        sundayRank.translatesAutoresizingMaskIntoConstraints = false
        loginView.addSubview(sundayRank)
        sundayRank.bottomAnchor.constraint(equalTo: sundayText.topAnchor, constant: spacingLabelButton).isActive = true
        sundayRank.centerXAnchor.constraint(equalTo: sundayText.centerXAnchor).isActive = true
        sundayRank.image = Constants.Images.circle1
        sundayRank.heightAnchor.constraint(equalToConstant: 30).isActive = true
        sundayRank.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        //MARK: tapDismiss
        tapDismiss.delegate = self
        
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
    
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        emailText.resignFirstResponder()
//        passText.resignFirstResponder()
//        return true
//    }
    
//    func textFieldDidChange(sender: UITextField) {
//        textChanged(sender)
//    }
    
//    func keyboardWillShow(_ notification:Notification) {
//        
//        if passText.isEditing || emailText.isEditing {
//            
//            view.frame.origin.y = 0 - getKeyboardHeight(notification)
//            
//        }
//    }
    
    func getKeyboardHeight(_ notification:Notification) -> CGFloat {
        
        let userInfo = notification.userInfo
        let keyboardSize = userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue // of CGRect
        
        return keyboardSize.cgRectValue.height/4.00
    }
    
//    func subscribeToKeyboardNotifications() {
//        
//        NotificationCenter.default.addObserver(self,
//                                               selector: #selector(keyboardWillShow(_:)),
//                                               name: .UIKeyboardWillShow,
//                                               object: nil)
//        NotificationCenter.default.addObserver(self,
//                                               selector: #selector(keyboardWillHide(_:)),
//                                               name: .UIKeyboardWillHide,
//                                               object: nil)
//    }
//    
//    func unsubscribeFromKeyboardNotifications() {
//        
//        NotificationCenter.default.removeObserver(self,
//                                                  name: .UIKeyboardWillShow,
//                                                  object: nil)
//        NotificationCenter.default.removeObserver(self,
//                                                  name: .UIKeyboardWillHide,
//                                                  object: nil)
//    }
//    
//    func keyboardWillHide(_ notification:Notification) {
//        
//        view.frame.origin.y = 0
//    }
//    
    
    func dismissVC() {
        dismiss(animated: true, completion: nil)
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if touch.view!.isDescendant(of: loginView) {
            return false
        }
        return true
    }
    
    
}
