//
//  WelcomeViewController.swift
//  Reflect
//
//  Created by Enrique Torrendell on 1/10/17.
//  Copyright © 2017 Enrique Torrendell. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    // MARK: - Variables
    let loginButton = UIButton()
    let registerButton = UIButton()
 
    // MARK: - Loads
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    //MARK: - Functions
    func setupView() {
        
        //view
        view.backgroundColor = Constants.Color.darkGray
        
        //loginButton
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loginButton)
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 100).isActive = true
        loginButton.widthAnchor.constraint(equalToConstant: 250).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        loginButton.backgroundColor = Constants.Color.orangeCool
        loginButton.setTitle("Log in", for: .normal)
        loginButton.titleLabel?.font = Constants.Font.button
        loginButton.titleLabel?.textColor = UIColor.white
        loginButton.layer.cornerRadius = 3
        loginButton.isEnabled = true
        loginButton.isUserInteractionEnabled = true
        loginButton.addTarget(self, action: #selector(WelcomeViewController.loginPushed), for: UIControlEvents.touchUpInside)
        
        //registerButton
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(registerButton)
        registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        registerButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 15).isActive = true
        registerButton.widthAnchor.constraint(equalToConstant: 250).isActive = true
        registerButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        registerButton.backgroundColor = Constants.Color.orangeCool
        registerButton.setTitle("Register", for: .normal)
        registerButton.titleLabel?.font = Constants.Font.button
        registerButton.titleLabel?.textColor = UIColor.white
        registerButton.layer.cornerRadius = 3
        registerButton.isEnabled = true
        registerButton.isUserInteractionEnabled = true
        registerButton.addTarget(self, action: #selector(WelcomeViewController.registerPushed), for: UIControlEvents.touchUpInside)
    }
    
    func loginPushed() {
        NotificationCenter.default.post(name: Notification.Name.openLoginVC, object: nil)
    }
    
    func registerPushed() {
        NotificationCenter.default.post(name: Notification.Name.openRegisterVC, object: nil)
    }
    
    
}
