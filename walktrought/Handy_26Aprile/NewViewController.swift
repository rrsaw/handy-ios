//
//  NewViewController.swift
//  WithoutStoryboard
//
//  Created by Gianluca on 15/06/17.
//  Copyright © 2017 Gianluca. All rights reserved.
//

import UIKit

class NewViewController: ReviewsController {
    
    var index : Int!
    var photoGallery : UIImageView!
    
    func changeView()
    {
        let vc = ReviewsController()
        self.present(vc, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backToProfile = UIButton()
        backToProfile.setImage(#imageLiteral(resourceName: "angle-pointing-to-left"), for: .normal)
        backToProfile.frame = CGRect(x: 0, y: 30, width: 24, height: 24)
        backToProfile.addTarget(self, action: #selector(changeView), for: .touchUpInside)
        

        self.photoGallery = UIImageView(frame: self.view.frame)
        self.photoGallery.image = itemsPicture[index]
        self.view.addSubview(self.photoGallery)
        // Do any additional setup after loading the view.
        
        self.view.addSubview(backToProfile)
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    }

}
