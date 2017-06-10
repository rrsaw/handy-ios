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
        imageView.backgroundColor = .blue
        imageView.layer.cornerRadius = 20
        return imageView
    }()
    
    let titleItem: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .green
        textView.text = "Macbook"
        return textView
    }()
    
    let distanceItem: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .red
        textView.text = "Cusano"
        return textView
    }()
    
    let priceItem: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = UIColor.yellow
        textView.text = "100€"
        return textView
    }()
    
    let profileThumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.blue
        return imageView
    }()
    
    let profileText: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = UIColor.yellow
        textView.text = "Maurizio Lucci"
        return textView
    }()
    
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
    func setupViews(){
        addSubview(thumbnailImageView)
        addSubview(titleItem)
        addSubview(distanceItem)
        addSubview(priceItem)
        addSubview(separatorView)
        addSubview(profileThumbnailImageView)
        addSubview(profileText)

        _ = thumbnailImageView.anchor(nil, left: leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 20, bottomConstant: 0, rightConstant: 0, widthConstant: WIDTH*27, heightConstant: HEIGHT*15)
        _ = separatorView.anchor(thumbnailImageView.bottomAnchor, left: nil, bottom: nil, right: nil, topConstant: 20, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: WIDTH*100, heightConstant: 1)
        _ = titleItem.anchor(nil, left: thumbnailImageView.rightAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: WIDTH*50, heightConstant: 50)
        _ = distanceItem.anchor(titleItem.bottomAnchor, left: thumbnailImageView.rightAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: WIDTH*25, heightConstant: 25)
        _ = priceItem.anchor(titleItem.bottomAnchor, left: distanceItem.rightAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: WIDTH*25, heightConstant: 25)
        _ = profileThumbnailImageView.anchor(priceItem.bottomAnchor, left: thumbnailImageView.rightAnchor, bottom: nil, right: nil, topConstant: 5, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: WIDTH*6, heightConstant: WIDTH*6)
        _ = profileText.anchor(priceItem.bottomAnchor, left: profileThumbnailImageView.rightAnchor, bottom: nil, right: nil, topConstant: 5, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: WIDTH*40, heightConstant: WIDTH*6)
        
        
//        addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: thumbnailImageView)
//        addConstraintsWithFormat(format: "H:|-16-[v0(44)]", views: userProfileImageView)
//        addConstraintsWithFormat(format: "H:|[v0]|", views: separatorView)
//        addConstraintsWithFormat(format: "V:|-16-[v0]-[v1(1)]|", views: thumbnailImageView, separatorView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
