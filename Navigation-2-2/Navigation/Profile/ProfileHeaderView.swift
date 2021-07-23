//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Artemiy Zuzin on 30.05.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class ProfileHeaderView: UIView {
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var statusTextField: UITextField!
    @IBOutlet weak var setStatusButton: UIButton!
    
    var statusText = String()
    //var colorSet = UIColor().colorFromHex(hex: "#4885CC")
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        avatarImageView.layer.cornerRadius = avatarImageView.frame.width / 2
        avatarImageView.layer.borderColor = UIColor.white.cgColor
        
        statusTextField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        
        setStatusButton.layer.borderColor = UIColor.black.cgColor
        setStatusButton.layer.shadowOpacity = 0.7
        setStatusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        statusTextField.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5, constant: 37.355).isActive = true
    
    }
    
    @objc func buttonPressed() {
        print(statusLabel.text!)
        statusLabel.text = statusText
        statusLabel.sizeToFit()
    }
    
    @objc func statusTextChanged(_ textField: UITextField) {
        statusText = textField.text ?? statusLabel.text!
    }
}

