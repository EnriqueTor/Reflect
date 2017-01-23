//
//  Protocols.swift
//  Reflect
//
//  Created by Enrique Torrendell on 1/23/17.
//  Copyright © 2017 Enrique Torrendell. All rights reserved.
//

import Foundation
import UIKit


//MARK: - CloseView

protocol CloseViewProtocol { }

extension CloseViewProtocol {
    
    func closeView(button: UIImageView, inside: UIView,close: UIView, gesture: UIGestureRecognizer) {
        
        button.translatesAutoresizingMaskIntoConstraints = false
        inside.addSubview(button)
        button.centerXAnchor.constraint(equalTo: close.trailingAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: close.topAnchor).isActive = true
        button.image = Constants.Images.closeView
        button.heightAnchor.constraint(equalToConstant: 25).isActive = true
        button.widthAnchor.constraint(equalToConstant: 25).isActive = true
        button.isUserInteractionEnabled = true
        button.addGestureRecognizer(gesture)
        
    }
    
}

