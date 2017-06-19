//
//  TabbarController.swift
//  Handy_26Aprile
//
//  Created by Maurizio Lucci on 15/06/17.
//  Copyright © 2017 Federico Cattaneo. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController{
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        self.tabBar.isTranslucent = false
        self.tabBar.barTintColor =  UIColor.rgb(247, 248, 250)
        self.tabBar.tintColor = UIColor.rgb(59, 201, 219)

        
        let exploreController = ExploreController()
        let thirdNavigationController = UINavigationController(rootViewController: exploreController)
        thirdNavigationController.title = "Explore"
        thirdNavigationController.tabBarItem.image = UIImage(named: "explore")
                
        let loanController = LoanController()
        let navigationController = UINavigationController(rootViewController: loanController)
        navigationController.title = "Loans"
        navigationController.tabBarItem.image = UIImage(named: "loans")
        
        let profileController = ProfileController()
        let secondNavigationController = UINavigationController(rootViewController: profileController)
        secondNavigationController.title = "Profile"
        secondNavigationController.tabBarItem.image = UIImage(named: "profile")
        
        viewControllers = [thirdNavigationController, navigationController, secondNavigationController]
        
        if isLoggedIn() {
            let homeController = HomeController()
            viewControllers = [homeController]
        } else {
            perform(#selector(showLoginController), with: nil, afterDelay: 0.01)
        }
    }
    
    
    fileprivate func isLoggedIn() -> Bool {
        return false
    }
    
    func showLoginController() {
        let loginController = LoginController()
        present(loginController, animated: true, completion: nil )
    }
    
        
}





