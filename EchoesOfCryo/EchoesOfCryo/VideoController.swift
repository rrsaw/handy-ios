//
//  VideoController.swift
//  EchoesOfCryo
//
//  Created by Federico Cattaneo on 09/05/2017.
//  Copyright © 2017 MassimoFortarezza. All rights reserved.
//

import UIKit

class VideoController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    let logoImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.layer.cornerRadius = 30
        iv.image = UIImage(named: "logo_round")
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Echoes from Cryo"
        label.font = UIFont.systemFont(ofSize: 30)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "This project use Augmented Reality to enhance your experience"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .white
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()
    
    let actionButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.rgb(255, 23, 68)
        btn.layer.cornerRadius = HEIGHT*3.5
        btn.setTitle("How?", for: .normal)
        btn.addTarget(self, action: #selector(showTutorial), for: .touchUpInside)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = UIColor.rgb(47, 41, 51)
        setupCollectionView()
    }
    
    func showTutorial() {
        //        print("123")
        let layout = UICollectionViewFlowLayout()
        
        let dummySettingsViewController = HowController(collectionViewLayout : layout)
        //se si vuole transizione da destra ---- mettere anche aniamted nel present() a false
        //        let transition = CATransition()
        //        transition.duration = 0.5
        //        transition.type = kCATransitionPush
        //        transition.subtype = kCATransitionFromRight
        //        view.window!.layer.add(transition, forKey: kCATransition)
        self.present(dummySettingsViewController, animated:true, completion:nil)
    }
    
    func setupCollectionView() {
        view.addSubview(logoImageView)
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(actionButton)
        
        _ = logoImageView.anchor(view.topAnchor, left: nil, bottom: nil, right: nil, topConstant: HEIGHT*20, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: WIDTH*27, heightConstant: HEIGHT*15)
        logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        _ = titleLabel.anchor(logoImageView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: HEIGHT*5, leftConstant: WIDTH*8, bottomConstant: 0, rightConstant: WIDTH*8, widthConstant: 0, heightConstant: HEIGHT*7)
        
        _ = descriptionLabel.anchor(titleLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: HEIGHT*2.5, leftConstant: WIDTH*8, bottomConstant: 0, rightConstant: WIDTH*8, widthConstant: 0, heightConstant: HEIGHT*7)
        
        _ = actionButton.anchor(nil, left: nil, bottom: view.bottomAnchor, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: HEIGHT*20, rightConstant: 0, widthConstant: WIDTH*50, heightConstant: HEIGHT*7)
        actionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        //
        
        
    }
    
}


