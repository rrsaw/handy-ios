//
//  ExploreCell.swift
//  Handy_26Aprile
//
//  Created by Maurizio Lucci on 07/06/17.
//  Copyright © 2017 Federico Cattaneo. All rights reserved.
//

import UIKit
class ExploreCell: UICollectionViewCell {
    
    override init (frame: CGRect) {
        super.init(frame:frame)
        setupViews()
    }
    
    let thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 25
        imageView.image = UIImage(named: "mac")
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let titleItem: UILabel = {
        let uilabel = UILabel()
//        uilabel.backgroundColor = .green
        uilabel.text = "Macbook Pro 2017"
        uilabel.font = UIFont(name: "VarelaRound-Regular", size: 20)
        return uilabel
    }()
    
    let distanceImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "pin"))
        imageView.backgroundColor = .semiTransparent()
        return imageView
    }()
    
    let distanceItem: UILabel = {
        let uilabel = UILabel()
//        uilabel.backgroundColor = .red
        uilabel.text = "Cusano"
        uilabel.font = UIFont(name: "DINPro-Bold", size: 18)
        return uilabel
    }()
    
    let priceImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "euro"))
        imageView.backgroundColor = .semiTransparent()
        return imageView
    }()
    
    let priceItem: UILabel = {
        let uilabel = UILabel()
//        uilabel.backgroundColor = UIColor.yellow
        uilabel.text = "100€"
        uilabel.font = UIFont(name: "DINPro-Bold", size: 18)
        return uilabel
    }()
    
    let profileText: UILabel = {
        let uilabel = UILabel()
        uilabel.text = "Maurizio Lucci"
        uilabel.font = UIFont(name: "VarelaRound-Regular", size: 15)
        return uilabel
    }()
    
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .rgb(212, 220, 225)
        return view
    }()
    
    func setupViews(){
        addSubview(thumbnailImageView)
        addSubview(titleItem)
        addSubview(distanceImageView)
        addSubview(distanceItem)
        addSubview(priceImageView)
        addSubview(priceItem)
        addSubview(separatorView)
        addSubview(profileText)

        _ = thumbnailImageView.anchor(nil, left: leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 20, bottomConstant: 0, rightConstant: 15, widthConstant: WIDTH*27, heightConstant: HEIGHT*15)
        _ = separatorView.anchor(thumbnailImageView.bottomAnchor, left: nil, bottom: nil, right: nil, topConstant: 25, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: WIDTH*100, heightConstant: 1)
        _ = titleItem.anchor(nil, left: thumbnailImageView.rightAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 15, bottomConstant: 0, rightConstant: 0, widthConstant: WIDTH*50, heightConstant: 45)
        _ = distanceImageView.anchor(titleItem.bottomAnchor, left: thumbnailImageView.rightAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 15, bottomConstant: 0, rightConstant: 0, widthConstant: WIDTH*5, heightConstant: 25)
        _ = distanceItem.anchor(titleItem.bottomAnchor, left: distanceImageView.rightAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 10, bottomConstant: 0, rightConstant: 0, widthConstant: WIDTH*20, heightConstant: 25)
        _ = priceImageView.anchor(titleItem.bottomAnchor, left: distanceItem.rightAnchor, bottom: nil, right: priceItem.leftAnchor, topConstant: 0, leftConstant: 15, bottomConstant: 0, rightConstant: 10, widthConstant: WIDTH*5, heightConstant: 25)
        _ = priceItem.anchor(titleItem.bottomAnchor, left: priceImageView.rightAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: WIDTH*25, heightConstant: 25)
        _ = profileText.anchor(priceItem.bottomAnchor, left: thumbnailImageView.rightAnchor, bottom: nil, right: nil, topConstant: 10, leftConstant: 5, bottomConstant: 0, rightConstant: 0, widthConstant: WIDTH*40, heightConstant: WIDTH*6)
        
        
//        addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: thumbnailImageView)
//        addConstraintsWithFormat(format: "H:|-16-[v0(44)]", views: userProfileImageView)
//        addConstraintsWithFormat(format: "H:|[v0]|", views: separatorView)
//        addConstraintsWithFormat(format: "V:|-16-[v0]-[v1(1)]|", views: thumbnailImageView, separatorView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
