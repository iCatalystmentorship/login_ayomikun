//
//  ViewController.swift
//  Login App
//
//  Created by Adegoke Ayomikun on 08/10/2019.
//  Copyright © 2019 Dev mikzy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTextField.customizeTextField(iconName: "username")
        passwordTextField.customizeTextField(iconName: "password")
        
    }
    override func viewWillAppear(_ animated: Bool) {
        setGradientBackground()
        super.viewWillAppear(animated)
        loginButton.customizeButtonWithRoundedCorners()
   
    }
    
    func setGradientBackground() {
        let colorTop =  UIColor(red: 237.0/255.0, green: 127.0/255.0, blue: 106.0/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 233.0/255.0, green: 81.0/255.0, blue: 98.0/255.0, alpha: 1.0).cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds
        
        self.contentView.layer.insertSublayer(gradientLayer, at:0)
    }
}

