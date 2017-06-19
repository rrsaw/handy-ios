//
//  ViewController.swift
//  EchoesOfCryo
//
//  Created by Federico Cattaneo on 19/06/2017.
//  Copyright © 2017 Federico Cattaneo. All rights reserved.
//

import UIKit

class CreateAccountController: UICollectionViewController, UICollectionViewDelegateFlowLayout, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let picker = UIImagePickerController()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        navigationItem.title = "Home"
        return .lightContent
    }
    
    let logoImageView: UIButton = {
        let iv = UIButton()
        iv.contentMode = .scaleAspectFill
        iv.layer.cornerRadius = 50
        iv.setImage(#imageLiteral(resourceName: "logo"), for: .normal)
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.addTarget(self, action: #selector(profileImageHandler), for: .touchUpInside)
        return iv
    }()
    
    let selectedImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 50
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    func profileImageHandler(_ sender: UIButton) {

        
        let myPickerController = UIImagePickerController()
        myPickerController.delegate = self;
        myPickerController.sourceType = UIImagePickerControllerSourceType.photoLibrary
        
        self.present(myPickerController, animated: true, completion: nil)
        
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        selectedImageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        selectedImageView.backgroundColor = UIColor.clear
        selectedImageView.contentMode = UIViewContentMode.scaleAspectFill
        self.dismiss(animated: true, completion: nil)
        
    }
    
    let adressTextField: LeftPaddedTextField = {
        let textField = LeftPaddedTextField()
        textField.placeholder = "Adress"
        textField.layer.backgroundColor = UIColor.rgb(247, 248, 250).cgColor
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.rgb(212, 220, 225).cgColor
        textField.layer.cornerRadius = 25
        textField.keyboardType = .default
        return textField
    }()
    
    let numberTextField: LeftPaddedTextField = {
        let textField = LeftPaddedTextField()
        textField.placeholder = "Adress number"
        textField.layer.backgroundColor = UIColor.rgb(247, 248, 250).cgColor
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.rgb(212, 220, 225).cgColor
        textField.layer.cornerRadius = 25
        textField.keyboardType = .numberPad
        return textField
    }()
    
    let countryTextField: LeftPaddedTextField = {
        let textField = LeftPaddedTextField()
        textField.placeholder = "Country"
        textField.layer.backgroundColor = UIColor.rgb(247, 248, 250).cgColor
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.rgb(212, 220, 225).cgColor
        textField.layer.cornerRadius = 25
        textField.keyboardType = .default
        return textField
    }()
    
    let cityTextField: LeftPaddedTextField = {
        let textField = LeftPaddedTextField()
        textField.placeholder = "City"
        textField.layer.backgroundColor = UIColor.rgb(247, 248, 250).cgColor
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.rgb(212, 220, 225).cgColor
        textField.layer.cornerRadius = 25
        textField.keyboardType = .default
        return textField
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Fill out the fields and move to the final stage registration process"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.lightGray
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()
    
    let actionButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.rgb(34, 184, 287)
        btn.layer.cornerRadius = HEIGHT*3.5
        btn.setTitle("Next Step", for: .normal)
        btn.addTarget(self, action: #selector(showTutorial), for: .touchUpInside)
        return btn
    }()
    
    let backButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.rgb(183, 196, 203)
        btn.layer.cornerRadius = HEIGHT*3.5
        btn.setTitle("Back", for: .normal)
        btn.addTarget(self, action: #selector(showTutorial), for: .touchUpInside)
        return btn
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = UIColor.rgb(255, 255, 255)
        setupCollectionView()
        observeKeyboardNotifications()
        
    }
    
    func showTutorial() {
        self.dismiss(animated: true, completion: nil)
        
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
            
            let y: CGFloat = UIDevice.current.orientation.isLandscape ? -320 : -220
            self.view.frame = CGRect(x: 0, y: y, width: self.view.frame.width, height: self.view.frame.height)
            
        }, completion: nil)
    }
    
    func setupCollectionView() {
        view.addSubview(logoImageView)
        view.addSubview(adressTextField)
        view.addSubview(numberTextField)
        view.addSubview(countryTextField)
        view.addSubview(cityTextField)
        view.addSubview(descriptionLabel)
        view.addSubview(actionButton)
        view.addSubview(selectedImageView)
        view.addSubview(backButton)
        
        
        _ = logoImageView.anchor(view.topAnchor, left: nil, bottom: nil, right: nil, topConstant: HEIGHT*10, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: WIDTH*30, heightConstant: HEIGHT*17)
        logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        _ = adressTextField.anchor(logoImageView.topAnchor, left: nil, bottom: nil, right: nil, topConstant: HEIGHT*25, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: WIDTH*60, heightConstant: HEIGHT*7)
        adressTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        _ = numberTextField.anchor(adressTextField.topAnchor, left: nil, bottom: nil, right: nil, topConstant: HEIGHT*10, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: WIDTH*60, heightConstant: HEIGHT*7)
        numberTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        _ = countryTextField.anchor(numberTextField.topAnchor, left: nil, bottom: nil, right: nil, topConstant: HEIGHT*10, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: WIDTH*60, heightConstant: HEIGHT*7)
        countryTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        _ = cityTextField.anchor(countryTextField.topAnchor, left: nil, bottom: nil, right: nil, topConstant: HEIGHT*10, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: WIDTH*60, heightConstant: HEIGHT*7)
        cityTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        _ = descriptionLabel.anchor(cityTextField.topAnchor, left: nil, bottom: nil, right: nil, topConstant: HEIGHT*10, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: WIDTH*60, heightConstant: HEIGHT*7)
        descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        _ = actionButton.anchor(nil, left: backButton.rightAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: HEIGHT*8, rightConstant: 40, widthConstant: WIDTH*50, heightConstant: HEIGHT*7)
        
        _ = selectedImageView.anchor(view.topAnchor, left: nil, bottom: nil, right: nil, topConstant: HEIGHT*10, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: WIDTH*30, heightConstant: HEIGHT*17)
        selectedImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        _ = backButton.anchor(nil, left: nil, bottom: view.bottomAnchor, right: actionButton.leftAnchor, topConstant: 0, leftConstant: 0, bottomConstant: HEIGHT*8, rightConstant: 40, widthConstant: WIDTH*20, heightConstant: HEIGHT*7)
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
    
}


