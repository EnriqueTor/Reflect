//
//  CalendarView.swift
//  Reflect
//
//  Created by Enrique Torrendell on 1/18/17.
//  Copyright © 2017 Enrique Torrendell. All rights reserved.
//

import UIKit
import Firebase

class CalendarView: UIView, UIGestureRecognizerDelegate {

    //MARK: - Variables
    let loginView = UIView()
    let backgroundView = UIView()
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    let loginButton = UIButton()
    let database = FIRDatabase.database().reference()
    let store = DataStore.sharedInstance
    
    //MARK: - Loads
    override init(frame: CGRect){
        super.init(frame: frame)
    
        print("sahdfhskhfjkakljsdhfkljhakljsdghlkahsdkfhkashfklahdlskf")
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    //MARK: - Functions
    func commonInit() {
        
        let tapDismiss = UITapGestureRecognizer(target: self, action: #selector(CalendarView.dismissVC))
        
        //MARK: backgroundView
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(backgroundView)
        backgroundView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        backgroundView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        backgroundView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        backgroundView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        backgroundView.backgroundColor = Constants.Color.reflect0
        backgroundView.isUserInteractionEnabled = true
        backgroundView.addGestureRecognizer(tapDismiss)
        
        //MARK: loginView
        loginView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.addSubview(loginView)
        loginView.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor).isActive = true
        loginView.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor).isActive = true
        loginView.heightAnchor.constraint(equalToConstant: 180).isActive = true
        loginView.widthAnchor.constraint(equalToConstant: 280).isActive = true
        loginView.backgroundColor = UIColor.white
        loginView.layer.cornerRadius = 3
        
        //MARK: titleLabel
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        loginView.addSubview(titleLabel)
        titleLabel.centerXAnchor.constraint(equalTo: loginView.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: loginView.topAnchor, constant: 25).isActive = true
        titleLabel.text = "Calendar and analytics"
        titleLabel.font = Constants.Font.title
        
        //MARK: subtitleLabel
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        loginView.addSubview(subtitleLabel)
        subtitleLabel.centerXAnchor.constraint(equalTo: loginView.centerXAnchor).isActive = true
        subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 3).isActive = true
        subtitleLabel.text = "Coming soon"
        subtitleLabel.font = Constants.Font.subtitle
        
        //MARK: loginButton
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginView.addSubview(loginButton)
        loginButton.centerXAnchor.constraint(equalTo: loginView.centerXAnchor).isActive = true
        loginButton.bottomAnchor.constraint(equalTo: loginView.bottomAnchor, constant: -15).isActive = true
        loginButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor, constant: -15).isActive = true
        loginButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor, constant: 15).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        loginButton.backgroundColor = Constants.Color.orangeCool
        loginButton.setTitle("Keep me posted", for: .normal)
        loginButton.titleLabel?.font = Constants.Font.button
        loginButton.titleLabel?.textColor = UIColor.white
        loginButton.layer.cornerRadius = 3
        loginButton.addTarget(self, action: #selector(LoginViewController.loginPushed), for: UIControlEvents.touchUpInside)
        
        //MARK: tapDismiss
        tapDismiss.delegate = self
        
    }
    
    func dismissVC() {
        NotificationCenter.default.post(name: Notification.Name.openWelcomeVC, object: nil)
    }
    
    func loginPushed() {
        
//        guard let email = emailText.text, let pass = passText.text else { return }
//        
//        if email != "" && pass != "" {
//            
//            FIRAuth.auth()?.signIn(withEmail: email, password: pass) { (user, error) in
//                
//                if let error = error {
//                    self.errorLabel.text = error.localizedDescription
//                }
//                else {
//                    self.store.user.id = (FIRAuth.auth()?.currentUser?.uid)!
//                    self.store.user.email = email
//                    
//                    NotificationCenter.default.post(name: Notification.Name.openMainVC, object: nil)
//                }
//            }
//        }
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if touch.view!.isDescendant(of: loginView) {
            return false
        }
        return true
    }
    
}
