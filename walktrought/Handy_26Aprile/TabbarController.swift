//
//  TabbarController.swift
//  Handy_26Aprile
//
//  Created by Maurizio Lucci on 15/06/17.
//  Copyright © 2017 Federico Cattaneo. All rights reserved.
//

import UIKit

class TabbarController: UITabBarController{
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        
        let layout = UICollectionViewFlowLayout()
        let exploreController = ExploreController()
        let thirdNavigationController = UINavigationController(rootViewController: exploreController)
        thirdNavigationController.title = "Explore"
//        thirdNavigationController.tabBarItem.image = UIImage(named: "items")
        
//        let mapsController = ExploreController(collectionViewLayout : layout)
        let loanController = LoanController()
        let navigationController = UINavigationController(rootViewController: loanController)
        navigationController.title = "Loans"
//        navigationController.tabBarItem.image = UIImage(named: "loanIcon")
        
        //        let profileController = ExploreController()
//        let profileController = ReviewsController()
        let profileController = DetailController()
        let secondNavigationController = UINavigationController(rootViewController: profileController)
        secondNavigationController.title = "Profile"
//        secondNavigationController.tabBarItem.image = UIImage(named: "user")
        
        viewControllers = [thirdNavigationController, navigationController, secondNavigationController]
        
        if isLoggedIn() {
            //assume user is logged in
            let homeController = HomeController()
            viewControllers = [homeController]
        } else {
            perform(#selector(showLoginController), with: nil, afterDelay: 0.01)
        }
        
        //        self.view.window!.rootViewController?.dismissViewControllerAnimated(false, completion: nil)
        
        //        self.navigationController?.popViewController(animated: true)
        //        self.presentViewController(ExploreController, animated:true, completion:nil)
        //        let exploreController = ExploreController()
        //        viewControllers = [exploreController]
        
        
    }
    
    fileprivate func isLoggedIn() -> Bool {
        return false
    }
    
    func showLoginController() {
        let loginController = LoginController()
        present(loginController, animated: true, completion: nil )
    }
        
    }
