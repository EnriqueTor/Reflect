//
//  MainViewController.swift
//  Reflect
//
//  Created by Enrique Torrendell on 1/11/17.
//  Copyright © 2017 Enrique Torrendell. All rights reserved.
//

import UIKit
import Foundation

class MainViewController: UIViewController {

    //MARK: - Variables
    let messageView = UILabel()
//    let headerView = UIView()
//    let mainView = UICollectionView()
    let footView = UIView()
    let settingView = UIImageView()
    let settingLabel = UILabel()
    let titleLabel = UILabel()
    
    //MARK: - Loads
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    //MARK: - Functions
    
    func setupView() {
        
        //view
        view.backgroundColor = Constants.Color.darkGray
        
        //messageView
        messageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(messageView)
        messageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        messageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        messageView.text = "Main"
        messageView.textColor = Constants.Color.spaceGray
        messageView.font = Constants.Font.title
        
        //footView
        footView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(footView)
        footView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        footView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        footView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        footView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        footView.backgroundColor = Constants.Color.orangeCool
        
        //subtitleLabel
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        footView.addSubview(titleLabel)
        titleLabel.centerXAnchor.constraint(equalTo: footView.centerXAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: footView.centerYAnchor).isActive = true
        titleLabel.text = "Reflect"
        titleLabel.font = Constants.Font.subtitle
        titleLabel.textColor = UIColor.white
        
        //settingView
        settingView.translatesAutoresizingMaskIntoConstraints = false
        footView.addSubview(settingView)
        settingView.leadingAnchor.constraint(equalTo: footView.leadingAnchor, constant: 15).isActive = true
        settingView.centerYAnchor.constraint(equalTo: footView.centerYAnchor).isActive = true
        settingView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        settingView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        settingView.image = UIImage(named: "settings")
        
//        //settingLabel
//        settingLabel.translatesAutoresizingMaskIntoConstraints = false
//        footView.addSubview(settingLabel)
//        settingLabel.bottomAnchor.constraint(equalTo: footView.bottomAnchor, constant: -5).isActive = true
//        settingLabel.centerXAnchor.constraint(equalTo: settingView.centerXAnchor).isActive = true
//        settingLabel.text = "Settings"
//        settingLabel.font = Constants.Font.small
//        settingLabel.textColor = UIColor.white
        
        
    }
    
    //MARK: - Functions
    
    
    
    override var prefersStatusBarHidden: Bool {
            return true

    }
   
}
