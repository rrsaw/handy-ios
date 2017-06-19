//
//  LoginController.swift
//  Handy_26Aprile
//
//  Created by Federico Cattaneo on 13/05/2017.
//  Copyright © 2017 Federico Cattaneo. All rights reserved.
//

import UIKit
import Alamofire

let defaults = UserDefaults.standard

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
        button.titleLabel!.font = UIFont(name: "DINPro-Regular", size: 16)
        button.setTitleColor(UIColor.rgb(117, 134, 146), for: .normal)
        return button
    }()
    
    let facebookButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "fb.png"), for: .normal)
        button.backgroundColor = UIColor.rgb(50, 69, 184)
        button.imageEdgeInsets = UIEdgeInsetsMake(14, 20, 14, 20)
        button.tintColor = UIColor.white
        button.layer.cornerRadius = 25
        button.layer.shadowColor = UIColor.rgb(50, 69, 184).cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 8.0)
        button.layer.shadowOpacity = 0.3
        button.layer.shadowRadius = 13
        return button
    }()
    
    let createAccountButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Do not have an account? \n Create Account", for: .normal)
        button.titleLabel!.font = UIFont(name: "DINPro-Regular", size: 14)
        button.titleLabel?.numberOfLines = 2
        button.setTitleColor(.lightGray, for: .normal)
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 10
        button.contentHorizontalAlignment = .center
        button.addTarget(self, action: #selector(showCreateAccount), for: .touchUpInside)
        return button
    }()
    
    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor.rgb(59, 201, 219)
        button.setTitle("Login", for: .normal)
        button.titleLabel!.font = UIFont(name: "DINPro-Bold", size: 16)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 25
        button.layer.shadowColor = UIColor.rgb(59, 201, 219).cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 8.0)
        button.layer.shadowOpacity = 0.3
        button.layer.shadowRadius = 13
        button.addTarget(self, action: #selector(pressButton), for: .touchUpInside)
        return button
    }()
    
    let emailTextField: LeftPaddedTextField = {
        let textFieldM = LeftPaddedTextField()
        textFieldM.placeholder = "Enter email"
        textFieldM.font = UIFont(name: "VarelaRound-Regular", size: 18)
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
        textFieldP.font = UIFont(name: "VarelaRound-Regular", size: 18)
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
    
    
    func showCreateAccount(sender: UIButton){
        let layout = UICollectionViewFlowLayout()
        let dummySettingsViewController = CreateAccountController(collectionViewLayout : layout)
        self.present(dummySettingsViewController, animated:true, completion:nil)
        
        
    }
    
    func gotoExplore(sender: UIButton) {
        let mails = emailTextField
        let password = passwordTextField
        
        let parameters: Parameters = [
            "email" : mails,
            "password" : password
        ]
        print(parameters)
        
    }
    
    
    var skipButtonTopAnchor: NSLayoutConstraint?
    var nextButtonTopAnchor: NSLayoutConstraint?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Handy"
        
        observeKeyboardNotifications()
        
        view.addSubview(collectionView)

        view.addSubview(logoImageView)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(forgotPasswordButton)
        view.addSubview(loginButton)
        view.addSubview(facebookButton)
        view.addSubview(createAccountButton)
        
        _ = logoImageView.anchor(view.centerYAnchor, left: nil, bottom: nil, right: nil, topConstant: -230, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 100, heightConstant: 100)
        logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        _ = emailTextField.anchor(logoImageView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 32, leftConstant: 32, bottomConstant: 0, rightConstant: 32, widthConstant: 0, heightConstant: 50)
        
        _ = passwordTextField.anchor(emailTextField.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 16, leftConstant: 32, bottomConstant: 0, rightConstant: 32, widthConstant: 0, heightConstant: 50)
        
        _ = forgotPasswordButton.anchor(passwordTextField.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 16, leftConstant: 50, bottomConstant: 0, rightConstant: 50, widthConstant: 0, heightConstant: 50)
        
        _ = loginButton.anchor(forgotPasswordButton.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 25, leftConstant: 32, bottomConstant: 0, rightConstant: 100, widthConstant: 0, heightConstant: 50)
        
        _ = facebookButton.anchor(forgotPasswordButton.bottomAnchor, left: loginButton.rightAnchor, bottom: nil, right: nil, topConstant: 25, leftConstant: 15, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
        
        _ = createAccountButton.anchor(nil, left: nil, bottom: view.bottomAnchor, right: nil, topConstant: 0, leftConstant: 32, bottomConstant: 70, rightConstant: 32, widthConstant: WIDTH*60, heightConstant: HEIGHT*9)
        createAccountButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
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

                
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    fileprivate func moveControlConstraintsOffScreen() {
        
        skipButtonTopAnchor?.constant = -40
        nextButtonTopAnchor?.constant = -40
    }
    
    fileprivate func registerCells() {
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: cellId)

    }
    
    
    
    
    
    func finishLoggingIn() {
        let rootViewController = UIApplication.shared.keyWindow?.rootViewController
        guard let mainNavigationController = rootViewController as? MainNavigationController else { return }
        
        mainNavigationController.viewControllers = [HomeController()]
        //Rimanere loggato a chiusura app (non ancora funzionante)
        Constant.defaults.set(true, forKey: "isLoggedIn")
        Constant.defaults.synchronize()
        
        dismiss(animated: true, completion: nil)
    }
    
    func pressButton(sender: UIButton){
        

        let mails = emailTextField.text!
        let password = passwordTextField.text!
        let parameters: Parameters = [
            "email" : mails,
            "password" : password
        ]
        
        Alamofire.request("http://handyshare.me/api/v1/login", method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON(completionHandler: { response in
            
            if let json = response.result.value as? [String: Any] {
                let idUser = json["id"]!
                defaults.set(idUser, forKey: "Id")
                
                self.dismiss(animated: true, completion: nil)
            } else{
                let alertController = UIAlertController(title: "Wrong Username or Password", message: "Try Again", preferredStyle: UIAlertControllerStyle.alert)
                
                alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { (alert) in
                    alertController.dismiss(animated: true, completion: nil)
                }))
                    
                self.present(alertController, animated: true)
            }
            
        })
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
}

class LeftPaddedTextField: UITextField {
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.width + 10, height: bounds.height)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.width + 10, height: bounds.height)
    }
}
