//
//  ViewController.swift
//  WithoutStoryboard
//
//  Created by Gianluca on 25/05/17.
//  Copyright © 2017 Gianluca. All rights reserved.
//

import UIKit
import Alamofire

let detailUsers: [String] = ["Bertie Fernandez", "Randall Morgan", "Roy Davis"]

let detailComments: [String] = ["Excellent seller, order came quickly. Excellent product, very beautiful jacket good quality but very small size, take at least 2 above size!", "I received the product in good condition!", "By far the best jacket I've ever had! Excellent quality. Very well made, I recommend this seller.","ciao ciao ciao", "due due due", "tre tre tre"]


let detailItemsPicture: [UIImage] = [#imageLiteral(resourceName: "photocamera"), #imageLiteral(resourceName: "fotocamera"), #imageLiteral(resourceName: "photocamera"), #imageLiteral(resourceName: "fotocamera"), #imageLiteral(resourceName: "photocamera"), #imageLiteral(resourceName: "fotocamera"), #imageLiteral(resourceName: "photocamera"), #imageLiteral(resourceName: "fotocamera"), #imageLiteral(resourceName: "photocamera")]

class DetailController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var idItem: Int = 0
    fileprivate var jsonData: Array<Dictionary<String, AnyObject>> = []

    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white

        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
//        self.navigationController?.navigationBar.isTranslucent = true
//        self.navigationController?.view.backgroundColor = UIColor.clear
        
        collectionViewA.register(UICollectionViewCell.self, forCellWithReuseIdentifier: collectionViewAIdentifier)
        

        
        self.tableView = UITableView(frame: CGRect(x: 0, y: 500, width: self.view.frame.width, height: 150))
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifierDetail)
        
        
        self.tableView.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = CGFloat(100)
        
        let backgroundProfileImage = UIImageView()
        
        backgroundProfileImage.contentMode = .scaleAspectFit

        
        
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
        distanceLabel.text = "\(idItem)"
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
        
        let startDateButton  = UIButton(type: .system)
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

        let endDateButton  = UIButton(type: .system)
        endDateButton.setTitle("12 Mar", for: .normal)
        endDateButton.setTitleColor(.white, for: .normal)
        endDateButton.backgroundColor = UIColor.rgb(252, 196, 25)
        endDateButton.layer.cornerRadius = HEIGHT*2.5
        endDateButton.titleLabel!.font = UIFont(name: "DINPro-Bold", size: 14)
        
        endDateButton.layer.shadowColor = UIColor.rgb(252, 196, 25).cgColor
        endDateButton.layer.shadowOffset = CGSize(width: 0, height: 8.0)
        endDateButton.layer.shadowOpacity = 0.3
        endDateButton.layer.shadowRadius = 13
        
        let rentButton  = UIButton(type: .system)
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
        
        let placeLabel = UILabel()
        placeLabel.text = "Milano"
        placeLabel.font = UIFont(name: "VarelaRound-Regular", size: 18)
        placeLabel.textColor = .white
        
        
        let locMarkerButton = UIButton()
        locMarkerButton.setImage(#imageLiteral(resourceName: "location-pin"), for: .normal)

        
        
        let borrowedNumbersLabel = UILabel()
        borrowedNumbersLabel.text = "472"
        borrowedNumbersLabel.font = UIFont(name: "VarelaRound-Regular", size: 20)
        borrowedNumbersLabel.textColor = .black
        borrowedNumbersLabel.textAlignment = .center
        
        let borrowedLabel = UILabel()
        borrowedLabel.text = "Borrowed"
        borrowedLabel.font = UIFont(name: "VarelaRound-Regular", size: 18)
        borrowedLabel.textColor = UIColor.rgb(183, 196, 203)
        borrowedLabel.textAlignment = .center
        
        let lentNumbersLabel = UILabel()
        lentNumbersLabel.text = "119"
        lentNumbersLabel.font = UIFont(name: "VarelaRound-Regular", size: 20)
        lentNumbersLabel.textColor = .black
        lentNumbersLabel.textAlignment = .center
        self.view.addSubview(lentNumbersLabel)
        
        let lentLabel = UILabel()
        lentLabel.text = "Lent"
        lentLabel.font = UIFont(name: "VarelaRound-Regular", size: 18)
        lentLabel.textColor = UIColor.rgb(183, 196, 203)
        lentLabel.textAlignment = .center
        
        let itemsNumbersLabel = UILabel()
        itemsNumbersLabel.text = "6"
        itemsNumbersLabel.font = UIFont(name: "VarelaRound-Regular", size: 20)
        itemsNumbersLabel.textColor = .black
        itemsNumbersLabel.textAlignment = .center
        
        let itemsLabel = UILabel()
        itemsLabel.text = "Items"
        itemsLabel.font = UIFont(name: "VarelaRound-Regular", size: 18)
        itemsLabel.textColor = UIColor.rgb(183, 196, 203)
        itemsLabel.textAlignment = .center
        
        let settingsButton = UIButton()
        settingsButton.setTitle("SETTINGS", for: .normal)
        settingsButton.setTitleColor(.black, for: .normal)
        settingsButton.titleLabel?.font = UIFont(name: "VarelaRound-Regular", size: 15)

        
        let detailsButton = UIButton()
        detailsButton.setTitle("DETAILS", for: .normal)
        detailsButton.setTitleColor(.black, for: .normal)
        detailsButton.titleLabel?.font = UIFont(name: "VarelaRound-Regular", size: 15)
        
        let reviewsButton = UIButton()
        reviewsButton.setTitle("REVIEWS", for: .normal)
        reviewsButton.setTitleColor(.black, for: .normal)
        reviewsButton.titleLabel?.font = UIFont(name: "VarelaRound-Regular", size: 15)
        
        let separatorView: UIView = {
            let view = UIView()
            view.backgroundColor = .rgb(241, 241, 241)
            return view
        }()

        let itemId = (Constant.defaults.string(forKey: "Id"))!

        
        Alamofire.request("http://handyshare.me/api/v1/items").responseJSON { response in
            
            if let JSON = response.result.value {
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
                self.jsonData = JSON as! Array<Dictionary<String, AnyObject>>
            }
        }
        
        self.view.addSubview(itemLabel)
        self.view.addSubview(backgroundProfileImage)
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

        
        
        
        _ = itemLabel.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, topConstant: 80, leftConstant: 20, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    
        _ = categoryItemLabel.anchor(itemLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: nil, topConstant: 2, leftConstant: 20, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        _ = backgroundProfileImage.anchor(categoryItemLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 20, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: WIDTH*100, heightConstant: HEIGHT*35)
        backgroundProfileImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        _ = priceLabel.anchor(view.topAnchor, left: nil, bottom: nil, right: view.rightAnchor, topConstant: 80, leftConstant: 0, bottomConstant: 0, rightConstant: 20, widthConstant: 0, heightConstant: 0)
        
        _ = distanceLabel.anchor(priceLabel.bottomAnchor, left: nil, bottom: nil, right: view.rightAnchor, topConstant: 2, leftConstant: 0, bottomConstant: 0, rightConstant: 20, widthConstant: 0, heightConstant: 0)
        
        _ = starsDetail.anchor(backgroundProfileImage.bottomAnchor, left: view.leftAnchor, bottom: nil, right: nil, topConstant: 20, leftConstant: 20, bottomConstant: 0, rightConstant: 0, widthConstant: WIDTH*23, heightConstant: HEIGHT*2)
        
        _ = sumStarsLabel.anchor(backgroundProfileImage.bottomAnchor, left: starsDetail.rightAnchor, bottom: nil, right: nil, topConstant: 17, leftConstant: 20, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        _ = shareButton.anchor(backgroundProfileImage.bottomAnchor, left: nil, bottom: nil, right: shareButtonLabel.leftAnchor, topConstant: 20, leftConstant: 0, bottomConstant: 0, rightConstant: 10, widthConstant: HEIGHT*3, heightConstant: HEIGHT*3)
        
        _ = shareButtonLabel.anchor(backgroundProfileImage.bottomAnchor, left: shareButton.rightAnchor, bottom: nil, right: view.rightAnchor, topConstant: 20, leftConstant: 0, bottomConstant: 0, rightConstant: 20, widthConstant: 0, heightConstant: 0)
        
        _ = startDateButton.anchor(starsDetail.bottomAnchor, left: view.leftAnchor, bottom: nil, right: nil, topConstant: 30, leftConstant: 20, bottomConstant: 0, rightConstant: 0, widthConstant: WIDTH*15, heightConstant: HEIGHT*5)
        
        _ = toButton.anchor(starsDetail.bottomAnchor, left: startDateButton.rightAnchor, bottom: nil, right: nil, topConstant: 35, leftConstant: 15, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        _ = endDateButton.anchor(starsDetail.bottomAnchor, left: toButton.rightAnchor, bottom: nil, right: nil, topConstant: 30, leftConstant: 15, bottomConstant: 0, rightConstant: 0, widthConstant: WIDTH*15, heightConstant: HEIGHT*5)
        
        _ = rentButton.anchor(starsDetail.bottomAnchor, left: nil, bottom: nil, right: view.rightAnchor, topConstant: 25, leftConstant: 0, bottomConstant: 0, rightConstant: 20, widthConstant: WIDTH*25, heightConstant: HEIGHT*7)

        
        Alamofire.request("http://handyshare.me/api/v1/items/\(idItem)").responseJSON { response in
            if let JSON = response.result.value {
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
                self.jsonData = JSON as! Array<Dictionary<String, AnyObject>>
                itemLabel.text = self.jsonData[0]["name"] as? String
                categoryItemLabel.text = self.jsonData[0]["category"]?["name"] as? String
                priceLabel.text = "€ \(String(describing: self.jsonData[0]["price"]!))"
                distanceLabel.text = self.jsonData[0]["address"]?["city"] as? String
                let imageName = (self.jsonData[0]["image"]?["name"] as? String)!
                let urlString = "http://handyshare.me/images/items/\(imageName)"
                let url = URL(string: urlString)
                let dateFormatter = DateFormatter()
                let start = self.jsonData[0]["start_date"]
                let end = self.jsonData[0]["end_date"]
                dateFormatter.dateFormat = "yyyy-MM-dd"
                let start_format = dateFormatter.date(from: start as! String)
                let end_format = dateFormatter.date(from: end as! String)
                dateFormatter.dateFormat = "dd MMM"
                let start_date = dateFormatter.string(from: start_format!)
                let end_date = dateFormatter.string(from: end_format!)
                startDateButton.setTitle(start_date, for: .normal)
                endDateButton.setTitle(end_date, for: .normal)
                
                
                
                backgroundProfileImage.kf.setImage(with: url, placeholder: nil, options: nil, progressBlock: nil, completionHandler: nil)
                
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        
        let cellUno = collectionView.dequeueReusableCell(withReuseIdentifier: collectionViewAIdentifier, for: indexPath as IndexPath)
        
        let immagine = UIImageView(frame: cellUno.frame)
        immagine.image = itemsPicture[indexPath.row]

        cellUno.layer.masksToBounds = false
        
        cellUno.clipsToBounds = false
        cellUno.addSubview(immagine)
        
        immagine.center = CGPoint(x: 0, y: 25)
        
        return cellUno
        
    }
    
    func tapDetected() {
        print("Imageview Clicked")
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let x = FullImageController()
        x.index = indexPath.row
        self.present(x, animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemsPicture.count
    }
}

extension DetailController: UITableViewDelegate, UITableViewDataSource {
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = DetailCell(style: UITableViewCellStyle.default, reuseIdentifier: cellReuseIdentifierDetail)
        cell.setComponents(index: indexPath.row)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
    }
}



