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

        
    }
    
    static let defaults = UserDefaults.standard
}

extension UIColor {
    class func wwhite() -> UIColor {
        return white.withAlphaComponent(0.8)
    }
    class func semiTransparent() -> UIColor {
        return white.withAlphaComponent(0.5)
    }
}
