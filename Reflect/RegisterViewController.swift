//
//  RegisterViewController.swift
//  Reflect
//
//  Created by Enrique Torrendell on 1/10/17.
//  Copyright © 2017 Enrique Torrendell. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController, UITextFieldDelegate, UIGestureRecognizerDelegate {
    
    //MARK: - Variables
    let registerView = UIView()
    let backgroundView = UIView()
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    let emailText = UITextField()
    let passText = UITextField()
    let nameText = UITextField()
    let mailIcon = UIImageView()
    let passIcon = UIImageView()
    let registerButton = UIButton()
    let profileIcon = UIImageView()
    
    //MARK: - Loads
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    //MARK: - Functions
    func setupView() {
        
        let tapDismiss = UITapGestureRecognizer(target: self, action: #selector(LoginViewController.dismissVC))
        
        //backgroundView
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backgroundView)
        backgroundView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        backgroundView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        backgroundView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        backgroundView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        backgroundView.backgroundColor = Constants.Color.darkGray
        backgroundView.isUserInteractionEnabled = true
        backgroundView.addGestureRecognizer(tapDismiss)
        
        //registerView
        registerView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.addSubview(registerView)
        registerView.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor).isActive = true
        registerView.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor).isActive = true
        registerView.heightAnchor.constraint(equalToConstant: 340).isActive = true
        registerView.widthAnchor.constraint(equalToConstant: 280).isActive = true
        registerView.backgroundColor = UIColor.white
        registerView.layer.cornerRadius = 3
        
        //titleLabel
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        registerView.addSubview(titleLabel)
        titleLabel.centerXAnchor.constraint(equalTo: registerView.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: registerView.topAnchor, constant: 25).isActive = true
        titleLabel.text = "Register to"
        titleLabel.font = Constants.Font.title
        
        //subtitleLabel
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        registerView.addSubview(subtitleLabel)
        subtitleLabel.centerXAnchor.constraint(equalTo: registerView.centerXAnchor).isActive = true
        subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 3).isActive = true
        subtitleLabel.text = "Reflect"
        subtitleLabel.font = Constants.Font.subtitle
        
        //registerButton
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        registerView.addSubview(registerButton)
        registerButton.centerXAnchor.constraint(equalTo: registerView.centerXAnchor).isActive = true
        registerButton.bottomAnchor.constraint(equalTo: registerView.bottomAnchor, constant: -15).isActive = true
        registerButton.trailingAnchor.constraint(equalTo: registerView.trailingAnchor, constant: -15).isActive = true
        registerButton.leadingAnchor.constraint(equalTo: registerView.leadingAnchor, constant: 15).isActive = true
        registerButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        registerButton.backgroundColor = Constants.Color.orangeCool
        registerButton.setTitle("Register", for: .normal)
        registerButton.titleLabel?.font = Constants.Font.button
        registerButton.titleLabel?.textColor = UIColor.white
        registerButton.layer.cornerRadius = 3
        registerButton.isEnabled = true 
        registerButton.isUserInteractionEnabled = true
        
        //passText
        passText.translatesAutoresizingMaskIntoConstraints = false
        registerView.addSubview(passText)
        passText.centerXAnchor.constraint(equalTo: registerView.centerXAnchor).isActive = true
        passText.bottomAnchor.constraint(equalTo: registerButton.topAnchor, constant: -15).isActive = true
        passText.trailingAnchor.constraint(equalTo: registerView.trailingAnchor, constant: -15).isActive = true
        passText.leadingAnchor.constraint(equalTo: registerView.leadingAnchor, constant: 15).isActive = true
        passText.heightAnchor.constraint(equalToConstant: 44).isActive = true
        passText.layer.borderWidth = 0
        passText.background = UIImage(named: "input-outline")
        passText.placeholder = "Password"
        passText.font = Constants.Font.button
        passText.textColor = Constants.Color.orangeCool
        passText.setLeftPaddingPoints(50)
        passText.setRightPaddingPoints(10)
        passText.isSecureTextEntry = true
        passText.delegate = self
        passText.addTarget(self, action: #selector(LoginViewController.textFieldDidChange(sender:)), for: UIControlEvents.editingChanged)
        
        //emailText
        emailText.translatesAutoresizingMaskIntoConstraints = false
        registerView.addSubview(emailText)
        emailText.centerXAnchor.constraint(equalTo: registerView.centerXAnchor).isActive = true
        emailText.bottomAnchor.constraint(equalTo: passText.topAnchor, constant: -10).isActive = true
        emailText.trailingAnchor.constraint(equalTo: registerView.trailingAnchor, constant: -15).isActive = true
        emailText.leadingAnchor.constraint(equalTo: registerView.leadingAnchor, constant: 15).isActive = true
        emailText.heightAnchor.constraint(equalToConstant: 44).isActive = true
        emailText.layer.borderWidth = 0
        emailText.background = UIImage(named: "input-outline")
        emailText.placeholder = "Email"
        emailText.font = Constants.Font.button
        emailText.textColor = Constants.Color.orangeCool
        emailText.autocapitalizationType = .none
        emailText.setLeftPaddingPoints(50)
        emailText.setRightPaddingPoints(10)
        emailText.delegate = self
        emailText.addTarget(self, action: #selector(LoginViewController.textFieldDidChange(sender:)), for: UIControlEvents.editingChanged)
        
        //nameText
        nameText.translatesAutoresizingMaskIntoConstraints = false
        registerView.addSubview(nameText)
        nameText.centerXAnchor.constraint(equalTo: registerView.centerXAnchor).isActive = true
        nameText.bottomAnchor.constraint(equalTo: emailText.topAnchor, constant: -10).isActive = true
        nameText.trailingAnchor.constraint(equalTo: registerView.trailingAnchor, constant: -15).isActive = true
        nameText.leadingAnchor.constraint(equalTo: registerView.leadingAnchor, constant: 15).isActive = true
        nameText.heightAnchor.constraint(equalToConstant: 44).isActive = true
        nameText.layer.borderWidth = 0
        nameText.background = UIImage(named: "input-outline")
        nameText.placeholder = "Name"
        nameText.font = Constants.Font.button
        nameText.textColor = Constants.Color.orangeCool
        nameText.autocapitalizationType = .words
        nameText.setLeftPaddingPoints(50)
        nameText.setRightPaddingPoints(10)
        nameText.delegate = self
        nameText.addTarget(self, action: #selector(LoginViewController.textFieldDidChange(sender:)), for: UIControlEvents.editingChanged)
        
        
        //mailIcon
        mailIcon.translatesAutoresizingMaskIntoConstraints = false
        registerView.addSubview(mailIcon)
        mailIcon.centerYAnchor.constraint(equalTo: emailText.centerYAnchor).isActive = true
        mailIcon.trailingAnchor.constraint(equalTo: emailText.leadingAnchor, constant: 40).isActive = true
        mailIcon.image = UIImage(named: "icon-mail")
        
        //passIcon
        passIcon.translatesAutoresizingMaskIntoConstraints = false
        registerView.addSubview(passIcon)
        passIcon.centerYAnchor.constraint(equalTo: passText.centerYAnchor).isActive = true
        passIcon.trailingAnchor.constraint(equalTo: passText.leadingAnchor, constant: 40).isActive = true
        passIcon.image = UIImage(named: "icon-password")
        
        //profileIcon
        profileIcon.translatesAutoresizingMaskIntoConstraints = false
        registerView.addSubview(profileIcon)
        profileIcon.centerYAnchor.constraint(equalTo: nameText.centerYAnchor).isActive = true
        profileIcon.trailingAnchor.constraint(equalTo: nameText.leadingAnchor, constant: 44).isActive = true
        profileIcon.heightAnchor.constraint(equalToConstant: 23.5).isActive = true
        profileIcon.widthAnchor.constraint(equalToConstant: 34).isActive = true
        profileIcon.image = UIImage(named: "profile")
        
        //tapDismiss
        tapDismiss.delegate = self
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        emailText.resignFirstResponder()
        passText.resignFirstResponder()
        return true
    }
    
    func textFieldDidChange(sender: UITextField) {
        textChanged(sender)
    }
    
    func textChanged(_ sender: UITextField) {
        
        if sender == emailText && sender.text != "" {
            emailText.background = UIImage(named: "input-outline-active")
            mailIcon.image = UIImage(named: "icon-mail-active")
        }
        else if sender == emailText && sender.text == "" {
            emailText.background = UIImage(named: "input-outline")
            mailIcon.image = UIImage(named: "icon-mail")
        }
        else if sender == passText && sender.text != "" {
            passText.background = UIImage(named: "input-outline-active")
            passIcon.image = UIImage(named: "icon-password-active")
        }
        else if sender == passText && sender.text == "" {
            passText.background = UIImage(named: "input-outline")
            passIcon.image = UIImage(named: "icon-password")
        }
        else if sender == nameText && sender.text != "" {
            nameText.background = UIImage(named: "input-outline-active")
            profileIcon.image = UIImage(named: "profile-active")
        }
        else if sender == nameText && sender.text == "" {
            nameText.background = UIImage(named: "input-outline")
            profileIcon.image = UIImage(named: "profile")
        }
    }
    
    func dismissVC() {
        NotificationCenter.default.post(name: Notification.Name.openWelcomeVC, object: nil)
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if touch.view!.isDescendant(of: registerView){
            return false
        }
        return true
    }
    
}
