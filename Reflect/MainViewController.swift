//
//  MainViewController.swift
//  Reflect
//
//  Created by Enrique Torrendell on 1/11/17.
//  Copyright © 2017 Enrique Torrendell. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    //MARK: - Variables
    let messageView = UILabel()
//    let headerView = UIView()
//    let mainView = UICollectionView()
    let footView = UIView()
    let settingView = UIImageView()
    let settingLabel = UILabel()
    
    //MARK: - Loads
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    //MARK: - Functions
    
    func setupView() {
        
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
        footView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        footView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        footView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        footView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        footView.backgroundColor = Constants.Color.blueDark
        
        //settings
        settingView.translatesAutoresizingMaskIntoConstraints = false
        footView.addSubview(settingView)
        settingView.centerXAnchor.constraint(equalTo: footView.centerXAnchor).isActive = true
        settingView.centerYAnchor.constraint(equalTo: footView.centerYAnchor).isActive = true
        settingView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        settingView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        settingView.image = UIImage(named: "settings")
        
        //settingLabel
        settingLabel.translatesAutoresizingMaskIntoConstraints = false
        footView.addSubview(settingLabel)
        settingLabel.topAnchor.constraint(equalTo: settingView.bottomAnchor).isActive = true
        settingLabel.centerXAnchor.constraint(equalTo: settingView.centerXAnchor).isActive = true
        settingLabel.text = "Settings"
        settingLabel.font = Constants.Font.small
        
        
        
    }

    


}
