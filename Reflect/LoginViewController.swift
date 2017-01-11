//
//  LoginViewController.swift
//  Reflect
//
//  Created by Enrique Torrendell on 1/10/17.
//  Copyright © 2017 Enrique Torrendell. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate, UIGestureRecognizerDelegate {
    
    //MARK: - Variables
    let loginView = UIView()
    let backgroundView = UIView()
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    let emailText = UITextField()
    let passText = UITextField()
    let mailIcon = UIImageView()
    let passIcon = UIImageView()
    let loginButton = UIButton()
    
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
        
        //loginView
        loginView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.addSubview(loginView)
        loginView.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor).isActive = true
        loginView.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor).isActive = true
        loginView.heightAnchor.constraint(equalToConstant: 280).isActive = true
        loginView.widthAnchor.constraint(equalToConstant: 280).isActive = true
        loginView.backgroundColor = UIColor.white
        loginView.layer.cornerRadius = 3
        
        //titleLabel
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        loginView.addSubview(titleLabel)
        titleLabel.centerXAnchor.constraint(equalTo: loginView.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: loginView.topAnchor, constant: 25).isActive = true
        titleLabel.text = "Log in to"
        titleLabel.font = Constants.Font.title
        
        //subtitleLabel
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        loginView.addSubview(subtitleLabel)
        subtitleLabel.centerXAnchor.constraint(equalTo: loginView.centerXAnchor).isActive = true
        subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 3).isActive = true
        subtitleLabel.text = "Reflect"
        subtitleLabel.font = Constants.Font.subtitle
        
        //loginButton
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginView.addSubview(loginButton)
        loginButton.centerXAnchor.constraint(equalTo: loginView.centerXAnchor).isActive = true
        loginButton.bottomAnchor.constraint(equalTo: loginView.bottomAnchor, constant: -15).isActive = true
        loginButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor, constant: -15).isActive = true
        loginButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor, constant: 15).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        loginButton.backgroundColor = Constants.Color.blueDark
        loginButton.setTitle("Log in", for: .normal)
        loginButton.titleLabel?.font = Constants.Font.button
        loginButton.titleLabel?.textColor = UIColor.white
        loginButton.layer.cornerRadius = 3
        loginButton.addTarget(self, action: #selector(LoginViewController.buttonPushed), for: UIControlEvents.touchUpInside)
        
        //passText
        passText.translatesAutoresizingMaskIntoConstraints = false
        loginView.addSubview(passText)
        passText.centerXAnchor.constraint(equalTo: loginView.centerXAnchor).isActive = true
        passText.bottomAnchor.constraint(equalTo: loginButton.topAnchor, constant: -15).isActive = true
        passText.trailingAnchor.constraint(equalTo: loginView.trailingAnchor, constant: -15).isActive = true
        passText.leadingAnchor.constraint(equalTo: loginView.leadingAnchor, constant: 15).isActive = true
        passText.heightAnchor.constraint(equalToConstant: 44).isActive = true
        passText.layer.borderWidth = 0
        passText.background = UIImage(named: "input-outline")
        passText.placeholder = "Password"
        passText.font = Constants.Font.button
        passText.textColor = Constants.Color.blueDark
        passText.setLeftPaddingPoints(50)
        passText.setRightPaddingPoints(10)
        passText.isSecureTextEntry = true
        passText.delegate = self
        passText.addTarget(self, action: #selector(LoginViewController.textFieldDidChange(sender:)), for: UIControlEvents.editingChanged)
        
        //emailText
        emailText.translatesAutoresizingMaskIntoConstraints = false
        loginView.addSubview(emailText)
        emailText.centerXAnchor.constraint(equalTo: loginView.centerXAnchor).isActive = true
        emailText.bottomAnchor.constraint(equalTo: passText.topAnchor, constant: -10).isActive = true
        emailText.trailingAnchor.constraint(equalTo: loginView.trailingAnchor, constant: -15).isActive = true
        emailText.leadingAnchor.constraint(equalTo: loginView.leadingAnchor, constant: 15).isActive = true
        emailText.heightAnchor.constraint(equalToConstant: 44).isActive = true
        emailText.layer.borderWidth = 0
        emailText.background = UIImage(named: "input-outline")
        emailText.placeholder = "Email"
        emailText.font = Constants.Font.button
        emailText.textColor = Constants.Color.blueDark
        emailText.setLeftPaddingPoints(50)
        emailText.setRightPaddingPoints(10)
        emailText.delegate = self
        emailText.addTarget(self, action: #selector(LoginViewController.textFieldDidChange(sender:)), for: UIControlEvents.editingChanged)

        //mailIcon
        mailIcon.translatesAutoresizingMaskIntoConstraints = false
        loginView.addSubview(mailIcon)
        mailIcon.centerYAnchor.constraint(equalTo: emailText.centerYAnchor).isActive = true
        mailIcon.trailingAnchor.constraint(equalTo: emailText.leadingAnchor, constant: 40).isActive = true
        mailIcon.image = UIImage(named: "icon-mail")
        
        //passIcon
        passIcon.translatesAutoresizingMaskIntoConstraints = false
        loginView.addSubview(passIcon)
        passIcon.centerYAnchor.constraint(equalTo: passText.centerYAnchor).isActive = true
        passIcon.trailingAnchor.constraint(equalTo: passText.leadingAnchor, constant: 40).isActive = true
        passIcon.image = UIImage(named: "icon-password")
        
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
    }
    
    func dismissVC() {
        NotificationCenter.default.post(name: Notification.Name.openWelcomeVC, object: nil)
    }
    
    func buttonPushed() {
        if emailText.text != "" && passText.text != "" {
            loginButton.isEnabled = true
            print("tutututu")
            NotificationCenter.default.post(name: Notification.Name.openMainVC, object: nil)
        }
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if touch.view!.isDescendant(of: loginView) {
            return false
        }
        return true
    }
    
}
