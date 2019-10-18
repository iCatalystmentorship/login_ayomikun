//
//  Extensions.swift
//  Login App
//
//  Created by Adegoke Ayomikun on 08/10/2019.
//  Copyright © 2019 Dev mikzy. All rights reserved.
//

import Foundation
import UIKit
extension UIButton{
    func customizeButtonWithRoundedCorners(){
        self.layer.cornerRadius = 10
    }
}

extension UITextField{
    func customizeTextField(iconName:String){
        self.layer.cornerRadius = 20
        self.layer.borderWidth = 0.3
        self.layer.borderColor = UIColor.white.cgColor
        self.leftViewMode = UITextField.ViewMode.always
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        let image = UIImage(named: iconName)
        imageView.image = image
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        self.leftView = imageView
    }
}


