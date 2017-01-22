//
//  SettingsView.swift
//  Reflect
//
//  Created by Enrique Torrendell on 1/21/17.
//  Copyright © 2017 Enrique Torrendell. All rights reserved.
//

import UIKit
import Firebase
import UserNotifications
import MessageUI


class SettingsView: UIView, UIGestureRecognizerDelegate, MFMailComposeViewControllerDelegate {
    
    //MARK: - Variables
    let loginView = UIView()
    let backgroundView = UIView()
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    let loginButton = UIButton()
    let feedbackButton = UIButton()
    let database = FIRDatabase.database().reference()
    let store = DataStore.sharedInstance
    var topVC = UIApplication.shared.keyWindow?.rootViewController

    
    //MARK: - Loads
    override init(frame: CGRect){
        super.init(frame: frame)
        
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
        
        //MARK: loginView
        loginView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.addSubview(loginView)
        loginView.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor).isActive = true
        loginView.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor).isActive = true
        loginView.heightAnchor.constraint(equalToConstant: 280).isActive = true
        loginView.widthAnchor.constraint(equalToConstant: 280).isActive = true
        loginView.backgroundColor = UIColor.white
        loginView.layer.cornerRadius = 3
        
        //MARK: titleLabel
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        loginView.addSubview(titleLabel)
        titleLabel.centerXAnchor.constraint(equalTo: loginView.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: loginView.topAnchor, constant: 25).isActive = true
        titleLabel.text = "Thank you for using"
        titleLabel.font = Constants.Font.title
        
        //MARK: subtitleLabel
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        loginView.addSubview(subtitleLabel)
        subtitleLabel.centerXAnchor.constraint(equalTo: loginView.centerXAnchor).isActive = true
        subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 3).isActive = true
        subtitleLabel.text = "Reflect"
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
        loginButton.setTitle("Log out", for: .normal)
        loginButton.titleLabel?.font = Constants.Font.button
        loginButton.titleLabel?.textColor = UIColor.white
        loginButton.layer.cornerRadius = 3
        loginButton.addTarget(self, action: #selector(SettingsView.dismissVC), for: UIControlEvents.touchUpInside)
        
        //MARK: loginButton
        feedbackButton.translatesAutoresizingMaskIntoConstraints = false
        loginView.addSubview(feedbackButton)
        feedbackButton.centerXAnchor.constraint(equalTo: loginView.centerXAnchor).isActive = true
        feedbackButton.bottomAnchor.constraint(equalTo: loginButton.topAnchor, constant: -15).isActive = true
        feedbackButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor, constant: -15).isActive = true
        feedbackButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor, constant: 15).isActive = true
        feedbackButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        feedbackButton.backgroundColor = Constants.Color.orangeCool
        feedbackButton.setTitle("Feedback", for: .normal)
        feedbackButton.titleLabel?.font = Constants.Font.button
        feedbackButton.titleLabel?.textColor = UIColor.white
        feedbackButton.layer.cornerRadius = 3
        feedbackButton.addTarget(self, action: #selector(SettingsView.sendFeedback), for: UIControlEvents.touchUpInside)
        
        //MARK: tapDismiss
        tapDismiss.delegate = self
        
    }
    
    func dismissVC() {
        UserDefaults.standard.setValue(nil, forKey: "email")
        NotificationCenter.default.post(name: NSNotification.Name.openWelcomeVC, object: nil)
    }
    
    
    
    func sendFeedback() {
        
        if MFMailComposeViewController.canSendMail() {
            
            let mail = MFMailComposeViewController()
            
            mail.mailComposeDelegate = self
            mail.setToRecipients(["etorrendell@gmail.com"])
            mail.setSubject("Feedback")
            mail.setMessageBody("", isHTML: true)
            
            while((topVC!.presentedViewController) != nil){
                topVC = topVC!.presentedViewController
            }
            topVC?.present(mail, animated: true)

        } else {

            return
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if touch.view!.isDescendant(of: loginView) {
            return false
        }
        return true
    }
    
    func setUpLocalNotification(hour: Int, minute: Int) {
        
        // have to use NSCalendar for the components
        let calendar = NSCalendar(identifier: .gregorian)!
        
        var dateFire = Date()
        
        // if today's date is passed, use tomorrow
        var fireComponents = calendar.components( [NSCalendar.Unit.day, NSCalendar.Unit.month, NSCalendar.Unit.year, NSCalendar.Unit.hour, NSCalendar.Unit.minute], from:dateFire)
        
        if (fireComponents.hour! > hour
            || (fireComponents.hour == hour && fireComponents.minute! >= minute) ) {
            
            dateFire = dateFire.addingTimeInterval(86400)  // Use tomorrow's date
            fireComponents = calendar.components( [NSCalendar.Unit.day, NSCalendar.Unit.month, NSCalendar.Unit.year, NSCalendar.Unit.hour, NSCalendar.Unit.minute], from:dateFire);
        }
        
        // set up the time
        fireComponents.hour = hour
        fireComponents.minute = minute
        
        // schedule local notification
        dateFire = calendar.date(from: fireComponents)!
        
        let localNotification = UILocalNotification()
        localNotification.fireDate = dateFire
        localNotification.alertBody = "Record Today Numerily. Be completely honest: how is your day so far?"
        localNotification.repeatInterval = NSCalendar.Unit.day
        localNotification.soundName = UILocalNotificationDefaultSoundName
        
        UIApplication.shared.scheduleLocalNotification(localNotification)
        
    }
}
