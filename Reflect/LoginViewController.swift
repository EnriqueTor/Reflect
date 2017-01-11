//
//  LoginViewController.swift
//  Reflect
//
//  Created by Enrique Torrendell on 1/10/17.
//  Copyright © 2017 Enrique Torrendell. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passText: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        
    }
    
    @IBAction func viewPushed(_ sender: UITapGestureRecognizer) {
        
        dismiss(animated: true, completion: nil)
        
    }
    
    func setupView() {
        
        emailText.layer.borderWidth = 1
        emailText.layer.borderColor = Constants.Color.spaceGray.cgColor
        emailText.layer.masksToBounds = true

        
        emailText.setLeftPaddingPoints(50)
        emailText.setRightPaddingPoints(10)
        
        
        passText.setLeftPaddingPoints(50)
        passText.setRightPaddingPoints(10)
        
        loginButton.layer.cornerRadius = 2
        
    }
    
    
}
