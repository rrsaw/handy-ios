//
//  MainNavigationController.swift
//  Handy_26Aprile
//
//  Created by Federico Cattaneo on 13/05/2017.
//  Copyright © 2017 Federico Cattaneo. All rights reserved.
//

import UIKit

class MainNavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
//        view.backgroundColor = .blue
        
    }
}

class HomeController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "We're logged in"
        
        let imageView = UIImageView(image: UIImage(named: "home"))
        view.addSubview(imageView)
        _ = imageView.anchor(view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 64, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
    }
}



