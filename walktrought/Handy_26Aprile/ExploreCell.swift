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
        imageView.layer.cornerRadius = 15
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let titleItem: UILabel = {
        let uilabel = UILabel()
        uilabel.text = "Macbook Pro 2017"
        uilabel.font = UIFont(name: "VarelaRound-Regular", size: 18)
        return uilabel
    }()
    
    let distanceImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "pin"))
        imageView.backgroundColor = .semiTransparent()
        return imageView
    }()
    
    let distanceItem: UILabel = {
        let uilabel = UILabel()
        uilabel.text = "Cusano"
        uilabel.font = UIFont(name: "DINPro-Bold", size: 16)
        uilabel.textColor = UIColor.rgb(183, 196, 203)

        return uilabel
    }()
    
    let idItem: UILabel = {
        let uilabel = UILabel()
        uilabel.text = "Cusano"
        uilabel.font = UIFont(name: "DINPro-Bold", size: 16)
        uilabel.textColor = UIColor.rgb(183, 196, 203)
        uilabel.isHidden = true
        
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
        uilabel.font = UIFont(name: "DINPro-Bold", size: 16)
        uilabel.textColor = UIColor.rgb(183, 196, 203)

        return uilabel
    }()
    
    let profileText: UILabel = {
        let uilabel = UILabel()
        uilabel.text = "Maurizio Lucci"
        uilabel.font = UIFont(name: "VarelaRound-Regular", size: 15)
        uilabel.textColor = UIColor.rgb(0, 145, 234)
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
        
        _ = titleItem.anchor(nil, left: thumbnailImageView.rightAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 20, bottomConstant: 0, rightConstant: 0, widthConstant: WIDTH*50, heightConstant: 45)
        
        _ = distanceImageView.anchor(titleItem.bottomAnchor, left: thumbnailImageView.rightAnchor, bottom: nil, right: nil, topConstant: 3, leftConstant: 20, bottomConstant: 0, rightConstant: 0, widthConstant: WIDTH*4, heightConstant: WIDTH*6)
        
        _ = distanceItem.anchor(titleItem.bottomAnchor, left: distanceImageView.rightAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 15, bottomConstant: 0, rightConstant: 0, widthConstant: WIDTH*20, heightConstant: 25)
        
        _ = priceImageView.anchor(titleItem.bottomAnchor, left: distanceItem.rightAnchor, bottom: nil, right: priceItem.leftAnchor, topConstant: 3, leftConstant: 0, bottomConstant: 0, rightConstant: 20, widthConstant: WIDTH*4, heightConstant: WIDTH*5)
        
        _ = priceItem.anchor(titleItem.bottomAnchor, left: priceImageView.rightAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 10, bottomConstant: 0, rightConstant: 0, widthConstant: WIDTH*25, heightConstant: 25)
        
        _ = profileText.anchor(priceItem.bottomAnchor, left: thumbnailImageView.rightAnchor, bottom: nil, right: nil, topConstant: 10, leftConstant: 20, bottomConstant: 0, rightConstant: 0, widthConstant: WIDTH*40, heightConstant: WIDTH*6)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
