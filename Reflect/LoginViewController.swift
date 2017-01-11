//
//  LoginViewController.swift
//  Reflect
//
//  Created by Enrique Torrendell on 1/10/17.
//  Copyright © 2017 Enrique Torrendell. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passText: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var mailIcon: UIImageView!
    @IBOutlet weak var passIcon: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        
    }
    
    @IBAction func viewPushed(_ sender: UITapGestureRecognizer) {
        
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func emailTextChanged(_ sender: UITextField) {
    
        
        
        if sender == emailText && sender.text != "" {
            
            emailText.background = UIImage(named: "input-outline-active")
            mailIcon.image = UIImage(named: "icon-mail-active")
        
        } else if sender == emailText && sender.text == "" {
            
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
    
    func setupView() {
        
        emailText.setLeftPaddingPoints(50)
        emailText.setRightPaddingPoints(10)
        
        
        passText.setLeftPaddingPoints(50)
        passText.setRightPaddingPoints(10)
        
        loginButton.layer.cornerRadius = 3
        
        loginView.layer.cornerRadius = 3
        
        backgroundView.backgroundColor = Constants.Color.darkGray
        
        
    }
    
    
    
    
    
    
    
    
}
