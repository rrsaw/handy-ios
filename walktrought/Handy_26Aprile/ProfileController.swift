//
//  ViewController.swift
//  WithoutStoryboard
//
//  Created by Gianluca on 25/05/17.
//  Copyright © 2017 Gianluca. All rights reserved.
//

import UIKit
import Alamofire

let users: [String] = ["Bertie Fernandez", "Randall Morgan", "Roy Davis"]

let comments: [String] = ["Excellent seller, order came quickly. Excellent product, very beautiful jacket good quality but very small size, take at least 2 above size!", "I received the product in good condition!", "By far the best jacket I've ever had! Excellent quality. Very well made, I recommend this seller.","ciao ciao ciao", "due due due", "tre tre tre"]



let itemsPicture: [UIImage] = [#imageLiteral(resourceName: "photocamera"), #imageLiteral(resourceName: "fotocamera"), #imageLiteral(resourceName: "photocamera"), #imageLiteral(resourceName: "fotocamera"), #imageLiteral(resourceName: "photocamera"), #imageLiteral(resourceName: "fotocamera"), #imageLiteral(resourceName: "photocamera"), #imageLiteral(resourceName: "fotocamera"), #imageLiteral(resourceName: "photocamera")]

class ProfileController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
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
    let cellReuseIdentifier = "cell"
    var tableView: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = UIColor.clear

        
        collectionViewA.register(UICollectionViewCell.self, forCellWithReuseIdentifier: collectionViewAIdentifier)
        
        
        collectionViewA.delegate = self
        collectionViewA.backgroundColor = UIColor.rgb(247, 248, 250)
        collectionViewA.dataSource = self
        collectionViewA.isScrollEnabled = true
        collectionViewA.clipsToBounds = true
        
        self.tableView = UITableView(frame: CGRect(x: 0, y: 450, width: self.view.frame.width, height: HEIGHT*30))
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        

        self.tableView.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = CGFloat(100)
        
        
        let backgroundProfileImage = UIImageView()
        backgroundProfileImage.image = #imageLiteral(resourceName: "tech")
        
        let profileImageView = UIImageView()
        profileImageView.image = #imageLiteral(resourceName: "profileImg")
        profileImageView.layer.cornerRadius = 50.0
        profileImageView.clipsToBounds = true
        profileImageView.backgroundColor = .white
        
        
        let userLabel = UILabel()
        userLabel.text = "Jeanette Russell"
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
        
        let userId = (Constant.defaults.string(forKey: "Id"))!
        
        
        Alamofire.request("http://handyshare.me/api/v1/users/\(userId)").responseJSON { response in
            
            if let JSON = response.result.value {
                
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
                self.jsonData = JSON as! Array<Dictionary<String, AnyObject>>
                let name = self.jsonData[0]["name"]!
                let surname = self.jsonData[0]["surname"]
                let completeName = "\(name) \(surname!)"
                let id_address = self.jsonData[0]["address"]?["city"]
                let imageName = (self.jsonData[0]["profile_image"]?["name"])!
                let urlStringProfile = "http://handyshare.me/images/personal-images/\(imageName!)"
                print("http://handyshare.me/images/personal-images/\(imageName!)")
                let urlProfile = URL(string: urlStringProfile)


                userLabel.text = completeName
                placeLabel.text = id_address as? String
                profileImageView.kf.setImage(with: urlProfile, placeholder: nil, options: nil, progressBlock: nil, completionHandler: { completation in
                profileImageView.layoutSubviews()
                })

            }
            
        }

        self.view.addSubview(backgroundProfileImage) // Immagine back del profilo
        self.view.addSubview(profileImageView) // Immagine profilo
        self.view.addSubview(userLabel) // Username
        self.view.addSubview(placeLabel) // Location
        self.view.addSubview(locMarkerButton) // Icona Location
        self.view.addSubview(borrowedNumbersLabel) // # borrowed
        self.view.addSubview(borrowedLabel) // borrowed
        self.view.addSubview(lentNumbersLabel) // # Lent
        self.view.addSubview(lentLabel) // Lent
        self.view.addSubview(itemsNumbersLabel) // # Items
        self.view.addSubview(itemsLabel) // Items
        self.view.addSubview(settingsButton)
        self.view.addSubview(detailsButton)
        self.view.addSubview(reviewsButton)
        self.view.addSubview(separatorView)
        self.view.addSubview(collectionViewA)
        self.view.addSubview(tableView)
        self.view.addSubview(placeLabel)

        getData()
        
        _ = backgroundProfileImage.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: WIDTH*100, heightConstant: HEIGHT*35)
            backgroundProfileImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        _ = profileImageView.anchor(view.topAnchor, left: nil, bottom: nil, right: nil, topConstant: 65, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: WIDTH*25, heightConstant: WIDTH*25)
            profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        _ = userLabel.anchor(profileImageView.bottomAnchor, left: nil, bottom: nil, right: nil, topConstant: 10, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
            userLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        _ = placeLabel.anchor(userLabel.bottomAnchor, left: nil, bottom: nil, right: nil, topConstant: 5, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
            placeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        _ = locMarkerButton.anchor(userLabel.bottomAnchor, left: nil, bottom: nil, right: placeLabel.leftAnchor, topConstant: 5, leftConstant: 0, bottomConstant: 0, rightConstant: 3, widthConstant: 18, heightConstant: 18)
        
        // LENT
        _ = lentNumbersLabel.anchor(backgroundProfileImage.bottomAnchor, left: nil, bottom: nil, right: nil, topConstant: 20, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
            lentNumbersLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        _ = lentLabel.anchor(lentNumbersLabel.bottomAnchor, left: nil, bottom: nil, right: nil, topConstant: 10, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
            lentLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        // BORROWED
        _ = borrowedNumbersLabel.anchor(backgroundProfileImage.bottomAnchor, left: view.leftAnchor, bottom: nil, right: lentNumbersLabel.leftAnchor, topConstant: 20, leftConstant: 0, bottomConstant: 0, rightConstant: 00, widthConstant: 0, heightConstant: 0)
        _ = borrowedLabel.anchor(lentNumbersLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: lentLabel.leftAnchor, topConstant: 10, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        // ITEMS
        _ = itemsNumbersLabel.anchor(backgroundProfileImage.bottomAnchor, left: lentNumbersLabel.rightAnchor, bottom: nil, right: view.rightAnchor, topConstant: 20, leftConstant: 0, bottomConstant: 0, rightConstant: 00, widthConstant: 0, heightConstant: 0)
        _ = itemsLabel.anchor(lentNumbersLabel.bottomAnchor, left: lentLabel.rightAnchor, bottom: nil, right: view.rightAnchor, topConstant: 10, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        _ = collectionViewA.anchor(lentLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 20, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: WIDTH*100, heightConstant: HEIGHT*10)
        
        _ = settingsButton.anchor(collectionViewA.bottomAnchor, left: view.leftAnchor, bottom: nil, right: nil, topConstant: 10, leftConstant: WIDTH*7, bottomConstant: 0, rightConstant: 20, widthConstant: 0, heightConstant: 0)

        _ = detailsButton.anchor(collectionViewA.bottomAnchor, left: settingsButton.rightAnchor, bottom: nil, right: nil, topConstant: 10, leftConstant: 20, bottomConstant: 0, rightConstant: 20, widthConstant: 0, heightConstant: 0)
        
        _ = reviewsButton.anchor(collectionViewA.bottomAnchor, left: detailsButton.rightAnchor, bottom: nil, right: nil, topConstant: 10, leftConstant: 20, bottomConstant: 0, rightConstant: 20, widthConstant: 0, heightConstant: 0)
        
        _ = separatorView.anchor(reviewsButton.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 10, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 1)
        

    }
    
    func getData() {

        
        
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
        return itemsPicture.count // Replace with count of your data for collectionViewA
    }
}

extension ProfileController: UITableViewDelegate, UITableViewDataSource {
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = ReviewsCell(style: UITableViewCellStyle.default, reuseIdentifier: cellReuseIdentifier)
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
