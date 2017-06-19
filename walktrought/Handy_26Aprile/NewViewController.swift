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
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "First View"

        
        self.photoGallery = UIImageView()
        self.photoGallery.image = itemsPicture[index]
        self.photoGallery.contentMode = .scaleAspectFill
        
        let itemNameLabel = UILabel()
        itemNameLabel.text = "Canon EOS 3D"
        itemNameLabel.font = UIFont(name: "DINPro-Regular", size: 40)
        itemNameLabel.textColor = UIColor.rgb(255, 255, 255)
        
        let exitButton  = UIButton(type: .system)
        exitButton.setTitle("Close", for: .normal)
        exitButton.setTitleColor(.white, for: .normal)
        exitButton.backgroundColor = UIColor.rgb(252, 196, 25)
        exitButton.layer.cornerRadius = HEIGHT*3
        exitButton.titleLabel!.font = UIFont(name: "DINPro-Bold", size: 14)
        exitButton.addTarget(self, action: #selector(changeView), for: .touchUpInside)
        
        exitButton.layer.shadowColor = UIColor.rgb(252, 196, 25).cgColor
        exitButton.layer.shadowOffset = CGSize(width: 0, height: 8.0)
        exitButton.layer.shadowOpacity = 0.3
        exitButton.layer.shadowRadius = 13



        self.view.addSubview(self.photoGallery)
        self.view.addSubview(itemNameLabel)
        self.view.addSubview(exitButton)
        
        _ = photoGallery.anchor(view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: WIDTH*100, heightConstant: HEIGHT*100)
        
        _ = itemNameLabel.anchor(nil, left: view.leftAnchor, bottom: exitButton.topAnchor, right: nil, topConstant: 0, leftConstant: 20, bottomConstant: 20, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        _ = exitButton.anchor(nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: nil, topConstant: 0, leftConstant: 20, bottomConstant: 60, rightConstant: 0, widthConstant: WIDTH*30, heightConstant: HEIGHT*6)

    }

}
