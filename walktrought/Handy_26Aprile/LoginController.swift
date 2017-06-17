//
//  LoginController.swift
//  Handy_26Aprile
//
//  Created by Federico Cattaneo on 13/05/2017.
//  Copyright © 2017 Federico Cattaneo. All rights reserved.
//

import UIKit
import Alamofire
//var loginCell = LoginCell()

class LoginController: UIViewController, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UITextFieldDelegate {
    
    let cellId = "cellId"
    let loginCellId = "loginCellId"
    
    let logoImageView: UIImageView = {
        let image = UIImage(named: "logo")
        let imageView = UIImageView(image: image)
        return imageView
    }()
    
    let forgotPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Forgot your password?", for: .normal)
        button.setTitleColor(.lightGray, for: .normal)
        return button
    }()
    
    let facebookButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .blue
        button.setTitle("FB", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 25
        button.layer.shadowColor = UIColor.blue.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 8.0)
        button.layer.shadowOpacity = 0.3
        button.layer.shadowRadius = 13
        return button
    }()
    
    let createAccountButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Do not have an account? \n Create Account", for: .normal)
        button.titleLabel?.numberOfLines = 2
        button.setTitleColor(.lightGray, for: .normal)
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1
        button.contentHorizontalAlignment = .center
        //        button.addTarget(self, action: #selector(showMainNavigation), for: .touchUpInside)
        return button
    }()
    
    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .orange
        button.setTitle("Log in", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 25
        button.layer.shadowColor = UIColor.orange.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 8.0)
        button.layer.shadowOpacity = 0.3
        button.layer.shadowRadius = 13
        button.addTarget(self, action: #selector(pressButton), for: .touchUpInside)
        return button
    }()
    
    let emailTextField: LeftPaddedTextField = {
        let textFieldM = LeftPaddedTextField()
        textFieldM.placeholder = "Enter email"
        textFieldM.layer.borderColor = UIColor.rgb(212, 220, 225).cgColor
        textFieldM.layer.backgroundColor = UIColor.rgb(247, 248, 250).cgColor
        textFieldM.layer.borderWidth = 1
        textFieldM.layer.cornerRadius = 25
        textFieldM.keyboardType = .emailAddress
        return textFieldM
    }()
    
    let passwordTextField: LeftPaddedTextField = {
        let textFieldP = LeftPaddedTextField()
        textFieldP.placeholder = "Enter password"
        textFieldP.layer.borderColor = UIColor.rgb(212, 220, 225).cgColor
        textFieldP.layer.backgroundColor = UIColor.rgb(247, 248, 250).cgColor
        textFieldP.layer.borderWidth = 1
        textFieldP.isSecureTextEntry = true
        textFieldP.layer.cornerRadius = 25
        return textFieldP
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.delegate = self
        cv.isPagingEnabled = true
        return cv
    }()
    
    lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.pageIndicatorTintColor = .lightGray
        pc.currentPageIndicatorTintColor = UIColor(red: 247/255, green: 154/255, blue: 27/255, alpha: 1)
        pc.numberOfPages = self.pages.count + 1
        return pc
    }()
    
    lazy var skipButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Skip", for: .normal)
        button.setTitleColor(UIColor(red: 247/255, green: 154/255, blue: 27/255, alpha: 1), for: .normal)
        button.addTarget(self, action: #selector(skip), for: .touchUpInside)
        return button
    }()
    
    lazy var nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Next", for: .normal)
        button.setTitleColor(UIColor(red: 247/255, green: 154/255, blue: 27/255, alpha: 1), for: .normal)
        button.addTarget(self, action: #selector(nextPage), for: .touchUpInside)
        return button
    }()
    
    let pages: [Page] = {
        let firstPage = Page(title: "Share a great listen", message: "It's free to send your books to the people in your life. Every recipient's first book is on us.", imageName: "page1")
        
        let secondPage = Page(title: "Send from your library", message: "Tap the More menu next to any book. Choose \"Send this Book\"", imageName: "page2")
        
        let thirdPage = Page(title: "Send from the player", message: "Tap the More menu in the upper corner. Choose \"Send this Book\"", imageName: "page3")
        
        return [firstPage, secondPage, thirdPage]
    }()

    
    func skip() {
        // we only need to lines to do this
        pageControl.currentPage = pages.count - 1
        nextPage()
    }
    
    func gotoExplore(sender: UIButton) {
        let mails = emailTextField
        let password = passwordTextField
        
        let parameters: Parameters = [
            "email" : mails,
            "password" : password
        ]
        // Gestisco la richiesta
        print(parameters)
        
//        print("WWWWWWWWWW \(mails)")
//        
//        let parameters: Parameters = [
//            "email" : mails,
//            "password" : password
//        ]
//        // Gestisco la richiesta
//        print(parameters)
//        
//        // Gestisco la risposta
//        Alamofire.request("http://handy-db.dev/api/v1/login", method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON(completionHandler: { response in
//            
//            if let json = response.result.value as? [String: Any] {
//                self.dismiss(animated: true, completion: nil)
//            } else{
//                print("scemocoglione non fotti con il MOB")
//            }
//        })
        
    }
    
   
    
    func nextPage() {
        //we are on the last page
        if pageControl.currentPage == pages.count {
            return
        }
        
        //second last page
        if pageControl.currentPage == pages.count - 1 {
            moveControlConstraintsOffScreen()
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.view.layoutIfNeeded()
            }, completion: nil)
        }
        
        let indexPath = IndexPath(item: pageControl.currentPage + 3, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        pageControl.currentPage += 1
    }
    
    var pageControlBottomAnchor: NSLayoutConstraint?
    var skipButtonTopAnchor: NSLayoutConstraint?
    var nextButtonTopAnchor: NSLayoutConstraint?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Handy"
        
        observeKeyboardNotifications()
        
        view.addSubview(collectionView)
        view.addSubview(pageControl)
        view.addSubview(skipButton)
        view.addSubview(nextButton)
        view.addSubview(logoImageView)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(forgotPasswordButton)
        view.addSubview(loginButton)
        view.addSubview(facebookButton)
        view.addSubview(createAccountButton)
        
        
        pageControlBottomAnchor = pageControl.anchor(nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 40)[1]
        
        skipButtonTopAnchor = skipButton.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, topConstant: 16, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 60, heightConstant: 50).first
        
        nextButtonTopAnchor = nextButton.anchor(view.topAnchor, left: nil, bottom: nil, right: view.rightAnchor, topConstant: 16, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 60, heightConstant: 50).first
        
        _ = logoImageView.anchor(view.centerYAnchor, left: nil, bottom: nil, right: nil, topConstant: -230, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 100, heightConstant: 100)
        logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        _ = emailTextField.anchor(logoImageView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 32, leftConstant: 32, bottomConstant: 0, rightConstant: 32, widthConstant: 0, heightConstant: 50)
        
        _ = passwordTextField.anchor(emailTextField.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 16, leftConstant: 32, bottomConstant: 0, rightConstant: 32, widthConstant: 0, heightConstant: 50)
        
        _ = forgotPasswordButton.anchor(passwordTextField.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 16, leftConstant: 50, bottomConstant: 0, rightConstant: 50, widthConstant: 0, heightConstant: 50)
        
        _ = loginButton.anchor(forgotPasswordButton.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 25, leftConstant: 32, bottomConstant: 0, rightConstant: 100, widthConstant: 0, heightConstant: 50)
        
        _ = facebookButton.anchor(forgotPasswordButton.bottomAnchor, left: loginButton.rightAnchor, bottom: nil, right: nil, topConstant: 25, leftConstant: 15, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
        
        _ = createAccountButton.anchor(nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 32, bottomConstant: 70, rightConstant: 32, widthConstant: 0, heightConstant: 0)
        
        //use autolayout instead
        collectionView.anchorToTop(view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
        
        registerCells()
    }
    
    fileprivate func observeKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardShow), name: .UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardHide), name: .UIKeyboardWillHide, object: nil)
    }
    
    func keyboardHide() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            
            self.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
            
        }, completion: nil)
    }
    
    func keyboardShow() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            
            let y: CGFloat = UIDevice.current.orientation.isLandscape ? -100 : -50
            self.view.frame = CGRect(x: 0, y: y, width: self.view.frame.width, height: self.view.frame.height)
            
        }, completion: nil)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        view.endEditing(true)
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let pageNumber = Int(targetContentOffset.pointee.x / view.frame.width)
        pageControl.currentPage = pageNumber
        
        //we are on the last page
        if pageNumber == pages.count {
            moveControlConstraintsOffScreen()
        } else {
            //back on regular pages
            pageControlBottomAnchor?.constant = 0
            skipButtonTopAnchor?.constant = 16
            nextButtonTopAnchor?.constant = 16
        }
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    fileprivate func moveControlConstraintsOffScreen() {
        pageControlBottomAnchor?.constant = 40
        skipButtonTopAnchor?.constant = -40
        nextButtonTopAnchor?.constant = -40
    }
    
    fileprivate func registerCells() {
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: cellId)
//        collectionView.register(LoginCell.self, forCellWithReuseIdentifier: loginCellId)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count + 1
    }
    
//    func collectionView(_ collectionView: UICollectionView, canFocusItemAt indexPath: IndexPath) -> Bool {

//    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == pages.count {
            let loginCell = collectionView.dequeueReusableCell(withReuseIdentifier: loginCellId, for: indexPath)
            print("la cella è \(indexPath.item)")
//            return true
            return loginCell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! PageCell
        
        let page = pages[(indexPath as NSIndexPath).item]
        cell.page = page
        
//        return true
        return cell
        
    }
    
    func pressButton(sender: UIButton){
        
        print("WWWWWWWWWW \(pageControl.currentPage)")
        
//         I Parametri da inviare
        let mails = emailTextField.text!
        let password = passwordTextField.text!
//        print("WWWWWWWWWW \(mails)")
        
        let parameters: Parameters = [
            "email" : mails,
            "password" : password
        ]
        // Gestisco la richiesta
        print(parameters)
        
        // Gestisco la risposta
        Alamofire.request("http://handy-db.dev/api/v1/login", method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON(completionHandler: { response in
            
            if let json = response.result.value as? [String: Any] {
                self.dismiss(animated: true, completion: nil)
            } else{
                print("scemocoglione non fotti con il MOB")
            }
            
        })
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        //        print(UIDevice.current.orientation.isLandscape)
        
        collectionView.collectionViewLayout.invalidateLayout()
        
        let indexPath = IndexPath(item: pageControl.currentPage, section: 0)
        //scroll to indexPath after the rotation is going
        DispatchQueue.main.async {
            self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            self.collectionView.reloadData()
        }
    }
    
}

class LeftPaddedTextField: UITextField {
    // Aggiunta padding nel texfield
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.width + 10, height: bounds.height)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.width + 10, height: bounds.height)
    }
}
