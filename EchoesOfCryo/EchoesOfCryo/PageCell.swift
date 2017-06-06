//
//  PageCell.swift
//  audible
//
//  Created by Brian Voong on 9/1/16.
//  Copyright © 2016 Lets Build That App. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    
        override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        }
    
    var page: Page? {
        didSet {
            guard let page = page else {
                return
            }
            logoImageView.image = UIImage(named: page.imageName)?.withRenderingMode(.alwaysTemplate)
            logoImageView.tintColor = .white
            titleLabel.text = page.title
            descriptionLabel.text = page.message
            actionButton.setTitle(page.button, for: .normal)

        }
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
        label.numberOfLines = 3
        label.textAlignment = .center
        return label
    }()
    
    let actionButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.rgb(255, 23, 68)
        btn.layer.cornerRadius = HEIGHT*3.5
        btn.setTitle("How?", for: .normal)
        return btn
    }()
    

    
    func setupViews() {
        addSubview(logoImageView)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(actionButton)
        
        _ = logoImageView.anchor(topAnchor, left: nil, bottom: nil, right: nil, topConstant: HEIGHT*20, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: WIDTH*27, heightConstant: HEIGHT*15)
        logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        _ = titleLabel.anchor(logoImageView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: HEIGHT*5, leftConstant: WIDTH*8, bottomConstant: 0, rightConstant: WIDTH*8, widthConstant: 0, heightConstant: HEIGHT*7)
        
        _ = descriptionLabel.anchor(titleLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: HEIGHT*2.5, leftConstant: WIDTH*8, bottomConstant: 0, rightConstant: WIDTH*8, widthConstant: 0, heightConstant: HEIGHT*7)
        
        _ = actionButton.anchor(nil, left: nil, bottom: bottomAnchor, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: HEIGHT*20, rightConstant: 0, widthConstant: WIDTH*50, heightConstant: HEIGHT*7)
        actionButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
//
        }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}






