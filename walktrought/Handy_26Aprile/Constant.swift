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
        
        static let loginButton: UIButton = {
            let button = UIButton(type: .system)
            button.backgroundColor = .orange
            button.setTitle("Log in", for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.layer.cornerRadius = 25
            button.layer.shadowColor = UIColor.orange.cgColor
            button.layer.shadowOffset = CGSize(width: 0, height: 8.0)
            button.layer.shadowOpacity = 0.3
            button.layer.shadowRadius = 13
            return button
        }()

    }
}
