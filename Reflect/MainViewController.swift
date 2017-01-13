//
//  MainViewController.swift
//  Reflect
//
//  Created by Enrique Torrendell on 1/11/17.
//  Copyright © 2017 Enrique Torrendell. All rights reserved.
//

import UIKit
import Foundation

class MainViewController: UIViewController, UICollectionViewDelegateFlowLayout {

    //MARK: - Variables
    let messageView = UILabel()
//    let headerView = UIView()
//    let mainView = UICollectionView()
    let footView = UIView()
    let settingView = UIImageView()
    let addHabitLabel = UILabel()
    let titleLabel = UILabel()
    var collectionView = UICollectionView()
    
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
        
        //titleLabel
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        footView.addSubview(titleLabel)
        titleLabel.centerXAnchor.constraint(equalTo: footView.centerXAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: footView.bottomAnchor, constant: -5).isActive = true
        titleLabel.text = "Reflect"
        titleLabel.font = Constants.Font.subtitle
        titleLabel.textColor = UIColor.white
        
        //settingView
        settingView.translatesAutoresizingMaskIntoConstraints = false
        footView.addSubview(settingView)
        settingView.bottomAnchor.constraint(equalTo: footView.bottomAnchor, constant: -10).isActive = true
        settingView.leadingAnchor.constraint(equalTo: footView.leadingAnchor, constant: 15).isActive = true
        settingView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        settingView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        settingView.image = UIImage(named: "settings")
        
        //addHabitLabel
        addHabitLabel.translatesAutoresizingMaskIntoConstraints = false
        footView.addSubview(addHabitLabel)
        addHabitLabel.bottomAnchor.constraint(equalTo: footView.bottomAnchor, constant: 0).isActive = true
        addHabitLabel.trailingAnchor.constraint(equalTo: footView.trailingAnchor, constant: -15).isActive = true
        addHabitLabel.text = "+"
        addHabitLabel.font = Constants.Font.plus
        addHabitLabel.textColor = UIColor.white
        
        //collectionView
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 90, height: 120)
        
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
//        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.backgroundColor = UIColor.white
        self.view.addSubview(collectionView)
        
    }
    
    //MARK: - Functions
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 14
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath as IndexPath)
        cell.backgroundColor = UIColor.orange
        return cell
    }
    
    
}
