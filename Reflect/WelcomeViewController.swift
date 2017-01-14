//
//  WelcomeViewController.swift
//  Reflect
//
//  Created by Enrique Torrendell on 1/10/17.
//  Copyright © 2017 Enrique Torrendell. All rights reserved.
//

import UIKit
import Firebase

class WelcomeViewController: UIViewController {
    
    // MARK: - Variables
    let loginButton = UIButton()
    let titleLabel = UILabel()
    let registerButton = UIButton()
    let reflectIcon = UIImageView()
    let errorLabel = UILabel()
    let myKeychainWrapper = KeychainWrapper()
    let store = DataStore.sharedInstance
    
    // MARK: - Loads
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        login()
        print("============================> \(store.user.id)")
    }
    
    //MARK: - Functions
    func setupView() {
        
        //view
        view.backgroundColor = Constants.Color.darkGray
        
        //reflectIcon
        reflectIcon.image = UIImage(named: "circleLogo")
        reflectIcon.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(reflectIcon)
        reflectIcon.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        reflectIcon.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -150).isActive = true
        reflectIcon.heightAnchor.constraint(equalToConstant: 30).isActive = true
        reflectIcon.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        //titleLabel
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: reflectIcon.bottomAnchor, constant: 5).isActive = true
        titleLabel.text = "Reflect"
        titleLabel.font = Constants.Font.iconTitle
        titleLabel.textColor = UIColor.white
        
        
        //loginButton
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loginButton)
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 150).isActive = true
        loginButton.widthAnchor.constraint(equalToConstant: 250).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        loginButton.backgroundColor = Constants.Color.orangeCool
        loginButton.setTitle("Log in", for: .normal)
        loginButton.titleLabel?.font = Constants.Font.button
        loginButton.titleLabel?.textColor = UIColor.white
        loginButton.layer.cornerRadius = Constants.Sizes.buttonCorner
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
        registerButton.layer.cornerRadius = Constants.Sizes.buttonCorner
        registerButton.isEnabled = true
        registerButton.isUserInteractionEnabled = true
        registerButton.addTarget(self, action: #selector(WelcomeViewController.registerPushed), for: UIControlEvents.touchUpInside)
        
        //MARK: errorLabel
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(errorLabel)
        errorLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        errorLabel.bottomAnchor.constraint(equalTo: loginButton.topAnchor, constant: -5).isActive = true
        errorLabel.widthAnchor.constraint(equalTo: loginButton.widthAnchor).isActive = true
        errorLabel.textColor = UIColor.red
        errorLabel.font = Constants.Font.small
        errorLabel.numberOfLines = 2
        errorLabel.textAlignment = .center
        
    }
    
    func loginPushed() {
        NotificationCenter.default.post(name: Notification.Name.openLoginVC, object: nil)
    }
    
    func registerPushed() {
        NotificationCenter.default.post(name: Notification.Name.openRegisterVC, object: nil)
    }
    
    func login() {
        
        if UserDefaults.standard.value(forKey: "email") as? String == nil {
            return
        }
        else {
            
            let email = UserDefaults.standard.value(forKey: "email") as? String
            let pass = myKeychainWrapper.myObject(forKey: "v_Data") as? String
            
            FIRAuth.auth()?.signIn(withEmail: email!, password: pass!) { (user, error) in
            
                if error != nil {
                    self.errorLabel.text = error?.localizedDescription
                }
                else {
                self.store.user.id = (FIRAuth.auth()?.currentUser?.uid)!
                self.store.user.email = email!
                
                NotificationCenter.default.post(name: Notification.Name.openMainVC, object: nil)
            
                }
            }
        }
    }
    
}
