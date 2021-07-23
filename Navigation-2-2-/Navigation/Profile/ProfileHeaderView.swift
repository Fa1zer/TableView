//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Artemiy Zuzin on 30.05.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class ProfileHeaderView: UIView {
    @IBOutlet private weak var avatarImageView: UIImageView!
    @IBOutlet private weak var fullNameLabel: UILabel!
    @IBOutlet private weak var statusLabel: UILabel!
    @IBOutlet private weak var statusTextField: UITextField!
    @IBOutlet private weak var setStatusButton: UIButton!
    
    private var statusText = String()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        avatarImageView.layer.cornerRadius = avatarImageView.frame.width / 2
        avatarImageView.layer.borderColor = UIColor.white.cgColor
        
        statusTextField.addTarget(self, action: #selector(statusTextChanged),
                                  for: .editingChanged)
        statusTextField.widthAnchor.constraint(equalTo: widthAnchor,
                                               multiplier: 0.5,
                                               constant: 37.355).isActive = true
        
        setStatusButton.layer.borderColor = UIColor.black.cgColor
        setStatusButton.layer.shadowOpacity = 0.7
        setStatusButton.addTarget(self, action: #selector(buttonPressed),
                                  for: .touchUpInside)
    }
    
    @objc fileprivate func buttonPressed() {
        print(statusLabel.text!)
        statusLabel.text = statusText
        statusLabel.sizeToFit()
    }
    
    @objc fileprivate func statusTextChanged(_ textField: UITextField) {
        statusText = textField.text ?? statusLabel.text!
    }
}

