//
//  ViewController.swift
//  WithoutStoryboard
//
//  Created by Gianluca on 25/05/17.
//  Copyright © 2017 Gianluca. All rights reserved.
//

import UIKit

let detailUsers: [String] = ["Bertie Fernandez", "Randall Morgan", "Roy Davis"]

let detailComments: [String] = ["Excellent seller, order came quickly. Excellent product, very beautiful jacket good quality but very small size, take at least 2 above size!", "I received the product in good condition!", "By far the best jacket I've ever had! Excellent quality. Very well made, I recommend this seller.","ciao ciao ciao", "due due due", "tre tre tre"]



let detailItemsPicture: [UIImage] = [#imageLiteral(resourceName: "photocamera"), #imageLiteral(resourceName: "fotocamera"), #imageLiteral(resourceName: "photocamera"), #imageLiteral(resourceName: "fotocamera"), #imageLiteral(resourceName: "photocamera"), #imageLiteral(resourceName: "fotocamera"), #imageLiteral(resourceName: "photocamera"), #imageLiteral(resourceName: "fotocamera"), #imageLiteral(resourceName: "photocamera")]

class DetailController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    let collectionViewA: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: CGRect(x: 0, y: 360, width: WIDTH*100, height: HEIGHT*15), collectionViewLayout: layout)
        cv.backgroundColor = .white
        return cv
    }()
    
    
    let collectionViewAIdentifier = "CollectionViewACell"
    
    
    let labTime = UILabel()
    let cellReuseIdentifierDetail = "cell"
    var tableView: UITableView!
    //    let cellId = "Item"
    //    let reviewsCellId = "Reviews"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //        self.navigationController!.navigationBar.isTranslucent = false
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = UIColor.clear
        
        
        // Initialize the collection views, set the desired frames
        
        collectionViewA.register(UICollectionViewCell.self, forCellWithReuseIdentifier: collectionViewAIdentifier)
        
        
//        collectionViewA.delegate = self
//        collectionViewA.backgroundColor = UIColor.rgb(247, 248, 250)
//        collectionViewA.dataSource = self
//        collectionViewA.isScrollEnabled = true
//        collectionViewA.clipsToBounds = true
        
        // Register the table view cell class and its reuse id
        
        self.tableView = UITableView(frame: CGRect(x: 0, y: 500, width: self.view.frame.width, height: 150))
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifierDetail)
        
        
        self.tableView.backgroundColor = .white
        // This view controller itself will provide the delegate methods and row data for the table view.
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = CGFloat(100)
        
        
        
        
        //        let backPageButton = UIButton()
        //        backPageButton.setImage(UIImage(named: "photocamera.jpg"), for: .normal)
        //        backPageButton.frame = CGRect(x: 0, y: 30, width: 24, height: 24)
        
        
        //        let navProfileTitleLabel = UILabel()
        //        navProfileTitleLabel.text = "Profile"
        //        navProfileTitleLabel.font = UIFont(name: "VarelaRound", size: 18)
        //        navProfileTitleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        //        navProfileTitleLabel.textColor = .white
        //        navProfileTitleLabel.textAlignment = .center
        //        navProfileTitleLabel.frame = CGRect(x: 130, y: -20, width: 120, height: 120)
        
        // profile
        
        let backgroundProfileImage = UIImageView()
        backgroundProfileImage.image = #imageLiteral(resourceName: "photocamera")
        //        backgroundProfileImage.frame = CGRect(x: 0, y: 0, width: 400, height: 260)
        
        
        let itemLabel = UILabel()
        itemLabel.text = "GOPRO HERO BLACK"
        itemLabel.font = UIFont(name: "DINPro-Bold", size: 18)
        itemLabel.textColor = .black
        itemLabel.textAlignment = .left
        
        let categoryItemLabel = UILabel()
        categoryItemLabel.text = "CATEGORY NAME"
        categoryItemLabel.font = UIFont(name: "DINPro-Regular", size: 18)
        categoryItemLabel.textColor = .black
        categoryItemLabel.textAlignment = .left
        
        let priceLabel = UILabel()
        priceLabel.text = "€ 6,99"
        priceLabel.font = UIFont(name: "DINPro-Black", size: 18)
        priceLabel.textColor = UIColor.rgb(252, 196, 25)
        priceLabel.textAlignment = .right
        
        let distanceLabel = UILabel()
        distanceLabel.text = "Milano"
        distanceLabel.font = UIFont(name: "DINPro-Bold", size: 18)
        distanceLabel.textColor = UIColor.rgb(59, 201, 219)
        distanceLabel.textAlignment = .right

        let starsDetail = UIImageView()
        starsDetail.image = #imageLiteral(resourceName: "stars")
        
        let sumStarsLabel = UILabel()
        sumStarsLabel.text = "28 Reviews"
        sumStarsLabel.font = UIFont(name: "DINPro-Regular", size: 14)
        sumStarsLabel.textColor = .black
        sumStarsLabel.textAlignment = .right
        
        let shareButton  = UIButton(type: .custom)
        shareButton.setImage(UIImage(named: "share.png"), for: .normal)
        let shareButtonLabel = UILabel()
        shareButtonLabel.text = "Share"
        shareButtonLabel.font = UIFont(name: "DINPro-Regular", size: 14)
        shareButtonLabel.textColor = UIColor.rgb(252, 196, 25)
        
        let startDateButton  = UIButton(type: .custom)
        startDateButton.setTitle("9 Mar", for: .normal)
        startDateButton.setTitleColor(.white, for: .normal)
        startDateButton.backgroundColor = UIColor.rgb(252, 196, 25)
        startDateButton.layer.cornerRadius = HEIGHT*2.5
        startDateButton.titleLabel!.font = UIFont(name: "DINPro-Bold", size: 14)
        
        startDateButton.layer.shadowColor = UIColor.rgb(252, 196, 25).cgColor
        startDateButton.layer.shadowOffset = CGSize(width: 0, height: 8.0)
        startDateButton.layer.shadowOpacity = 0.3
        startDateButton.layer.shadowRadius = 13

        let toButton = UILabel()
        toButton.text = "to"
        toButton.font = UIFont(name: "DINPro-Regular", size: 14)
        toButton.textColor = .black
        toButton.textAlignment = .right

        let endDateButton  = UIButton(type: .custom)
        endDateButton.setTitle("12 Mar", for: .normal)
        endDateButton.setTitleColor(.white, for: .normal)
        endDateButton.backgroundColor = UIColor.rgb(252, 196, 25)
        endDateButton.layer.cornerRadius = HEIGHT*2.5
        endDateButton.titleLabel!.font = UIFont(name: "DINPro-Bold", size: 14)
        
        endDateButton.layer.shadowColor = UIColor.rgb(252, 196, 25).cgColor
        endDateButton.layer.shadowOffset = CGSize(width: 0, height: 8.0)
        endDateButton.layer.shadowOpacity = 0.3
        endDateButton.layer.shadowRadius = 13
        
        let rentButton  = UIButton(type: .custom)
        rentButton.setTitle("RENT", for: .normal)
        rentButton.setTitleColor(.white, for: .normal)
        rentButton.backgroundColor = UIColor.rgb(59, 201, 219)
        rentButton.layer.cornerRadius = HEIGHT*3.5
        rentButton.titleLabel!.font = UIFont(name: "DINPro-Bold", size: 14)

        rentButton.layer.shadowColor = UIColor.rgb(59, 201, 219).cgColor
        rentButton.layer.shadowOffset = CGSize(width: 0, height: 8.0)
        rentButton.layer.shadowOpacity = 0.3
        rentButton.layer.shadowRadius = 13

        
        
        
        
        
        
        
        let userLabel = UILabel()
        userLabel.text = "Jeanette Porcellina"
        userLabel.font = UIFont(name: "DINPro-Bold", size: 18)
        userLabel.textColor = .white
        userLabel.textAlignment = .center
        //        userLabel.frame = CGRect(x: 120, y: 165, width: 140, height: 50)
        
        let placeLabel = UILabel()
        placeLabel.text = "Milano"
        placeLabel.font = UIFont(name: "VarelaRound-Regular", size: 18)
        placeLabel.textColor = .white
        
        
        let locMarkerButton = UIButton()
        //        button.layer.borderColor = twitterBlue.cgColor
        //        button.layer.borderWidth = 1
        locMarkerButton.setImage(#imageLiteral(resourceName: "location-pin"), for: .normal)
        //        locMarkerButton.frame = CGRect(x: 150, y: 200, width: 18, height: 18)
        //        button.titleEdgeInsets = UIEdgeInsets
        
        
        let borrowedNumbersLabel = UILabel()
        borrowedNumbersLabel.text = "472"
        borrowedNumbersLabel.font = UIFont(name: "VarelaRound-Regular", size: 20)
        borrowedNumbersLabel.textColor = .black
        //        borrowedNumbersLabel.frame = CGRect(x: 50, y: 290, width: 80, height: 20)
        borrowedNumbersLabel.textAlignment = .center
        
        let borrowedLabel = UILabel()
        borrowedLabel.text = "Borrowed"
        borrowedLabel.font = UIFont(name: "VarelaRound-Regular", size: 18)
        borrowedLabel.textColor = UIColor.rgb(183, 196, 203)
        //        borrowedLabel.frame = CGRect(x: 50, y: 320, width: 80, height: 20)
        borrowedLabel.textAlignment = .center
        
        let lentNumbersLabel = UILabel()
        lentNumbersLabel.text = "119"
        lentNumbersLabel.font = UIFont(name: "VarelaRound-Regular", size: 20)
        lentNumbersLabel.textColor = .black
        //        lentNumbersLabel.frame = CGRect(x: 150, y: 290, width: 80, height: 20)
        lentNumbersLabel.textAlignment = .center
        self.view.addSubview(lentNumbersLabel)
        
        let lentLabel = UILabel()
        lentLabel.text = "Lent"
        lentLabel.font = UIFont(name: "VarelaRound-Regular", size: 18)
        lentLabel.textColor = UIColor.rgb(183, 196, 203)
        //        lentLabel.frame = CGRect(x: 150, y: 320, width: 80, height: 20)
        lentLabel.textAlignment = .center
        
        let itemsNumbersLabel = UILabel()
        itemsNumbersLabel.text = "6"
        itemsNumbersLabel.font = UIFont(name: "VarelaRound-Regular", size: 20)
        itemsNumbersLabel.textColor = .black
        //        itemsNumbersLabel.frame = CGRect(x: 250, y: 290, width: 80, height: 20)
        itemsNumbersLabel.textAlignment = .center
        
        let itemsLabel = UILabel()
        itemsLabel.text = "Items"
        itemsLabel.font = UIFont(name: "VarelaRound-Regular", size: 18)
        itemsLabel.textColor = UIColor.rgb(183, 196, 203)
        //        itemsLabel.frame = CGRect(x: 250, y: 320, width: 80, height: 20)
        itemsLabel.textAlignment = .center
        
        // parte sotto la collection view orizzontale (stelle, reviews, share)
        
        //        let reviewsCountLabel = UILabel()
        //        reviewsCountLabel.text = "28 reviews"
        //        reviewsCountLabel.font = UIFont(name: "VarelaRound", size: 14)
        //        reviewsCountLabel.font = UIFont.systemFont(ofSize: 14)
        //        reviewsCountLabel.textColor = .black
        //        reviewsCountLabel.frame = CGRect(x: 135, y: 470, width: 100, height: 20)
        //        reviewsCountLabel.textAlignment = .center
        
        let settingsButton = UIButton()
        settingsButton.setTitle("SETTINGS", for: .normal)
        settingsButton.setTitleColor(.black, for: .normal)
        settingsButton.titleLabel?.font = UIFont(name: "VarelaRound-Regular", size: 15)
        //        settingsButton.font = UIFont(name: "VarelaRound-Regular", size: 15)
        
        //        settingsButton.frame = CGRect(x: 10, y: 470, width: 100, height: 20)
        //        settingsButton.addTarget(self, action: Selector(("buttonTouched:")), for: UIControlEvents.touchUpInside)
        
        let detailsButton = UIButton()
        detailsButton.setTitle("DETAILS", for: .normal)
        detailsButton.setTitleColor(.black, for: .normal)
        detailsButton.titleLabel?.font = UIFont(name: "VarelaRound-Regular", size: 15)
        
        //        detailsButton.frame = CGRect(x: 135, y: 470, width: 100, height: 20)
        //        detailsButton.addTarget(self, action: Selector(("buttonTouched:")), for: UIControlEvents.touchUpInside)
        
        let reviewsButton = UIButton()
        reviewsButton.setTitle("REVIEWS", for: .normal)
        reviewsButton.setTitleColor(.black, for: .normal)
        reviewsButton.titleLabel?.font = UIFont(name: "VarelaRound-Regular", size: 15)
        
        let separatorView: UIView = {
            let view = UIView()
            view.backgroundColor = .rgb(241, 241, 241)
            return view
        }()
        //        reviewsButton.frame = CGRect(x: 220, y: 470, width: 100, height: 20)
        //        reviewsButton.addTarget(self, action: Selector(("buttonTouched:")), for: UIControlEvents.touchUpInside)
        
        //        self.view.addSubview(navProfileTitleLabel) // ??
        self.view.addSubview(itemLabel)
        self.view.addSubview(backgroundProfileImage) // Immagine back del profilo
        self.view.addSubview(categoryItemLabel)
        self.view.addSubview(priceLabel)
        self.view.addSubview(distanceLabel)
        self.view.addSubview(starsDetail)
        self.view.addSubview(sumStarsLabel)
        self.view.addSubview(shareButton)
        self.view.addSubview(shareButtonLabel)
        self.view.addSubview(startDateButton)
        self.view.addSubview(toButton)
        self.view.addSubview(endDateButton)
        self.view.addSubview(rentButton)








//        self.view.addSubview(profileImageView) // Immagine profilo
//        self.view.addSubview(userLabel) // Username
//        self.view.addSubview(placeLabel) // Location
//        self.view.addSubview(locMarkerButton) // Icona Location
//        self.view.addSubview(borrowedNumbersLabel) // # borrowed
//        self.view.addSubview(borrowedLabel) // borrowed
//        self.view.addSubview(lentNumbersLabel) // # Lent
//        self.view.addSubview(lentLabel) // Lent
//        self.view.addSubview(itemsNumbersLabel) // # Items
//        self.view.addSubview(itemsLabel) // Items
//        self.view.addSubview(settingsButton)
//        self.view.addSubview(detailsButton)
//        self.view.addSubview(reviewsButton)
//        self.view.addSubview(separatorView)
////        self.view.addSubview(collectionViewA)
//        self.view.addSubview(tableView)
//        self.view.addSubview(placeLabel)
        
        
        
        _ = itemLabel.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, topConstant: 40, leftConstant: 20, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    
        _ = categoryItemLabel.anchor(itemLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: nil, topConstant: 2, leftConstant: 20, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        _ = backgroundProfileImage.anchor(categoryItemLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 20, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: WIDTH*100, heightConstant: HEIGHT*35)
        backgroundProfileImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        _ = priceLabel.anchor(view.topAnchor, left: nil, bottom: nil, right: view.rightAnchor, topConstant: 40, leftConstant: 0, bottomConstant: 0, rightConstant: 20, widthConstant: 0, heightConstant: 0)
        
        _ = distanceLabel.anchor(priceLabel.bottomAnchor, left: nil, bottom: nil, right: view.rightAnchor, topConstant: 2, leftConstant: 0, bottomConstant: 0, rightConstant: 20, widthConstant: 0, heightConstant: 0)
        
        _ = starsDetail.anchor(backgroundProfileImage.bottomAnchor, left: view.leftAnchor, bottom: nil, right: nil, topConstant: 20, leftConstant: 20, bottomConstant: 0, rightConstant: 0, widthConstant: WIDTH*23, heightConstant: HEIGHT*2)
        
        _ = sumStarsLabel.anchor(backgroundProfileImage.bottomAnchor, left: starsDetail.rightAnchor, bottom: nil, right: nil, topConstant: 17, leftConstant: 20, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        _ = shareButton.anchor(backgroundProfileImage.bottomAnchor, left: nil, bottom: nil, right: shareButtonLabel.leftAnchor, topConstant: 20, leftConstant: 0, bottomConstant: 0, rightConstant: 10, widthConstant: HEIGHT*3, heightConstant: HEIGHT*3)
        
        _ = shareButtonLabel.anchor(backgroundProfileImage.bottomAnchor, left: shareButton.rightAnchor, bottom: nil, right: view.rightAnchor, topConstant: 20, leftConstant: 0, bottomConstant: 0, rightConstant: 20, widthConstant: 0, heightConstant: 0)
        
        _ = startDateButton.anchor(starsDetail.bottomAnchor, left: view.leftAnchor, bottom: nil, right: nil, topConstant: 30, leftConstant: 20, bottomConstant: 0, rightConstant: 0, widthConstant: WIDTH*15, heightConstant: HEIGHT*5)
        
        _ = toButton.anchor(starsDetail.bottomAnchor, left: startDateButton.rightAnchor, bottom: nil, right: nil, topConstant: 35, leftConstant: 15, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        _ = endDateButton.anchor(starsDetail.bottomAnchor, left: toButton.rightAnchor, bottom: nil, right: nil, topConstant: 30, leftConstant: 15, bottomConstant: 0, rightConstant: 0, widthConstant: WIDTH*15, heightConstant: HEIGHT*5)
        
        _ = rentButton.anchor(starsDetail.bottomAnchor, left: nil, bottom: nil, right: view.rightAnchor, topConstant: 25, leftConstant: 0, bottomConstant: 0, rightConstant: 20, widthConstant: WIDTH*25, heightConstant: HEIGHT*7)
        
        
//
//        _ = profileImageView.anchor(view.topAnchor, left: nil, bottom: nil, right: nil, topConstant: 65, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: WIDTH*25, heightConstant: WIDTH*25)
//        profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        
//        _ = userLabel.anchor(profileImageView.bottomAnchor, left: nil, bottom: nil, right: nil, topConstant: 10, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
//        userLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        
//        _ = placeLabel.anchor(userLabel.bottomAnchor, left: nil, bottom: nil, right: nil, topConstant: 5, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
//        placeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        
//        _ = locMarkerButton.anchor(userLabel.bottomAnchor, left: nil, bottom: nil, right: placeLabel.leftAnchor, topConstant: 5, leftConstant: 0, bottomConstant: 0, rightConstant: 3, widthConstant: 18, heightConstant: 18)
        
//        // LENT
//        _ = lentNumbersLabel.anchor(backgroundProfileImage.bottomAnchor, left: nil, bottom: nil, right: nil, topConstant: 20, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
//        lentNumbersLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        _ = lentLabel.anchor(lentNumbersLabel.bottomAnchor, left: nil, bottom: nil, right: nil, topConstant: 10, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
//        lentLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        
//        // BORROWED
//        _ = borrowedNumbersLabel.anchor(backgroundProfileImage.bottomAnchor, left: view.leftAnchor, bottom: nil, right: lentNumbersLabel.leftAnchor, topConstant: 20, leftConstant: 0, bottomConstant: 0, rightConstant: 00, widthConstant: 0, heightConstant: 0)
//        _ = borrowedLabel.anchor(lentNumbersLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: lentLabel.leftAnchor, topConstant: 10, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
//        
//        // ITEMS
//        _ = itemsNumbersLabel.anchor(backgroundProfileImage.bottomAnchor, left: lentNumbersLabel.rightAnchor, bottom: nil, right: view.rightAnchor, topConstant: 20, leftConstant: 0, bottomConstant: 0, rightConstant: 00, widthConstant: 0, heightConstant: 0)
//        _ = itemsLabel.anchor(lentNumbersLabel.bottomAnchor, left: lentLabel.rightAnchor, bottom: nil, right: view.rightAnchor, topConstant: 10, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
//        _ = collectionViewA.anchor(lentLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 20, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: WIDTH*100, heightConstant: HEIGHT*15)
        
//        _ = settingsButton.anchor(collectionViewA.bottomAnchor, left: view.leftAnchor, bottom: nil, right: nil, topConstant: 10, leftConstant: WIDTH*7, bottomConstant: 0, rightConstant: 20, widthConstant: 0, heightConstant: 0)
//        
//        _ = detailsButton.anchor(collectionViewA.bottomAnchor, left: settingsButton.rightAnchor, bottom: nil, right: nil, topConstant: 10, leftConstant: 20, bottomConstant: 0, rightConstant: 20, widthConstant: 0, heightConstant: 0)
//        
//        _ = reviewsButton.anchor(collectionViewA.bottomAnchor, left: detailsButton.rightAnchor, bottom: nil, right: nil, topConstant: 10, leftConstant: 20, bottomConstant: 0, rightConstant: 20, widthConstant: 0, heightConstant: 0)
//        
//        _ = separatorView.anchor(reviewsButton.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 10, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 1)
        
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        
        let cellUno = collectionView.dequeueReusableCell(withReuseIdentifier: collectionViewAIdentifier, for: indexPath as IndexPath)
        
        let immagine = UIImageView(frame: cellUno.frame)
        immagine.image = itemsPicture[indexPath.row]
        //        immagine.layer.cornerRadius = 10
        
        //        cellUno.layer.cornerRadius = 5.0
        cellUno.layer.masksToBounds = false
        
        cellUno.clipsToBounds = false
        //        immagine.layer.cornerRadius = 25
        
        cellUno.addSubview(immagine)
        
        
        
        immagine.center = CGPoint(x: 0, y: 25)
        
        
        //        let singleTap = UITapGestureRecognizer(target: self, action: #selector(ViewController.tapDetected))
        //        singleTap.numberOfTapsRequired = 1 // you can change this value
        //        immagine.isUserInteractionEnabled = true
        //        immagine.addGestureRecognizer(singleTap)
        //        view.addGestureRecognizer(singleTap)
        
        return cellUno
        
    }
    
    func tapDetected() {
        print("Imageview Clicked")
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let x = NewViewController()
        x.index = indexPath.row
        self.present(x, animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemsPicture.count // Replace with count of your data for collectionViewA
    }
}



