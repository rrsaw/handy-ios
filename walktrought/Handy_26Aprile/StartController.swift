//
//  StartController.swift
//  Handy_26Aprile
//
//  Created by Maurizio Lucci on 09/06/17.
//  Copyright © 2017 Federico Cattaneo. All rights reserved.
//

import UIKit

class StartController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        
        if isLoggedIn() {
            //assume user is logged in
//            let homeController = HomeController()
//            viewControllers = [homeController]
        } else {
            perform(#selector(showLoginController), with: nil, afterDelay: 0.01)
        }
    }
    
    fileprivate func isLoggedIn() -> Bool {
        return false
    }
    
    func showLoginController() {
        let loginController = LoginController()
        present(loginController, animated: true, completion: nil)
        
    }

}
