//
//  Constant.swift
//  Handy_26Aprile
//
//  Created by Maurizio Lucci on 07/06/17.
//  Copyright © 2017 Federico Cattaneo. All rights reserved.
//

import UIKit

let WIDTH = UIScreen.main.bounds.size.width/100
let HEIGHT = UIScreen.main.bounds.size.height/100


class Constant: NSObject {
    
    struct GlobalConstants {
        
//        static let loginButton: UIButton = {
//            let button = UIButton(type: .system)
//            button.backgroundColor = .orange
//            button.setTitle("Log in", for: .normal)
//            button.setTitleColor(.white, for: .normal)
//            button.layer.cornerRadius = 25
//            button.layer.shadowColor = UIColor.orange.cgColor
//            button.layer.shadowOffset = CGSize(width: 0, height: 8.0)
//            button.layer.shadowOpacity = 0.3
//            button.layer.shadowRadius = 13
//            return button
//        }()
//        
//        static let emailTextField: LeftPaddedTextField = {
//            let textFieldM = LeftPaddedTextField()
//            textFieldM.placeholder = "Enter email"
//            textFieldM.layer.borderColor = UIColor.rgb(212, 220, 225).cgColor
//            textFieldM.layer.backgroundColor = UIColor.rgb(247, 248, 250).cgColor
//            textFieldM.layer.borderWidth = 1
//            textFieldM.layer.cornerRadius = 25
//            textFieldM.keyboardType = .emailAddress
//            return textFieldM
//        }()
//        
//        static let passwordTextField: LeftPaddedTextField = {
//            let textFieldP = LeftPaddedTextField()
//            textFieldP.placeholder = "Enter password"
//            textFieldP.layer.borderColor = UIColor.rgb(212, 220, 225).cgColor
//            textFieldP.layer.backgroundColor = UIColor.rgb(247, 248, 250).cgColor
//            textFieldP.layer.borderWidth = 1
//            textFieldP.isSecureTextEntry = true
//            textFieldP.layer.cornerRadius = 25
//            return textFieldP
//        }()
        
    }
    
}

extension UIColor {
    class func wwhite() -> UIColor {
        return white.withAlphaComponent(0.8)
    }
    class func semiTransparent() -> UIColor {
        return white.withAlphaComponent(0.5)
    }
}
