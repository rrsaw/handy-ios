//
//  CategoryCell.swift
//  Explore1_12Marzo
//
//  Created by Federico Cattaneo on 12/05/2017.
//  Copyright © 2017 Federico Cattaneo. All rights reserved.
//

import UIKit

class CategoryCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Contenitore delle view orizzontali
    let appsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal // Scroll orizzontale
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.backgroundColor = UIColor.rgb(255, 248, 250)
        collectionView.translatesAutoresizingMaskIntoConstraints = false // Non ho ben capito a cosa serva sinceramente ora scrivo a gadda
        return collectionView
    }()

    
    private let cellId = "appCellId"
    
    func setupViews() {
        backgroundColor = UIColor.clear // clear = inivisibile (non bianco)
        
        addSubview(appsCollectionView)
        
        appsCollectionView.dataSource = self
        appsCollectionView.delegate = self
        
        appsCollectionView.register(AppCell.self, forCellWithReuseIdentifier: cellId)
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": appsCollectionView]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": appsCollectionView]))
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
    }
    
    
    // Imposto la grandezza delle view orizzontali
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: WIDTH*40, height: (frame.height / 100) * 90)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, 20, 0, 0) // Muove l'intera cella
//        return UIEdgeInsetsMake(<#T##top: CGFloat##CGFloat#>, <#T##left: CGFloat##CGFloat#>, <#T##bottom: CGFloat##CGFloat#>, <#T##right: CGFloat##CGFloat#>)
    }
    
}

class AppCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //Compongo quello che c'è dentro ogni singola cella

    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "leaf")
        iv.contentMode = .scaleAspectFill
//        iv.layer.cornerRadius = 30
        return iv
    }()

    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Gardening"
        label.font = UIFont.systemFont(ofSize: 18)
        label.numberOfLines = 1
        label.textColor = UIColor.white
        return label
    }()
    
    func setupViews() {
        layer.cornerRadius = WIDTH*2.5
        
        
        addSubview(imageView)
        addSubview(nameLabel)
        
        
        backgroundColor = UIColor.rgb(148, 197, 112)
        
        // Posiziono la ImageView
        imageView.frame =  CGRect(x: 0, y: 0, width: 70, height: 75)
        imageView.center = CGPoint(x: frame.width/2, y: 70)
        
        //Posiziono la Label
        nameLabel.frame = CGRect(x: frame.height - 15, y: 0, width: frame.width, height: 25) // div // watch testi lunghi out
        nameLabel.center = CGPoint(x: frame.width/2, y: frame.height/2 + 54)
        nameLabel.textAlignment = .center

    }

}

















