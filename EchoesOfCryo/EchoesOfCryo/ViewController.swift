//
//  ViewController.swift
//  EchoesOfCryo
//
//  Created by Massimo Fortarezza on 28/04/2017.
//  Copyright © 2017 MassimoFortarezza. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    let picker = UIImagePickerController()

    override var preferredStatusBarStyle: UIStatusBarStyle {
        navigationItem.title = "Home"
        
        return .lightContent
    }
    
//    let logoImageView: UIImageView = {
//        let iv = UIImageView()
//        iv.contentMode = .scaleAspectFill
//        iv.layer.cornerRadius = 50
//        iv.image = UIImage(named: "avatar")
//        iv.clipsToBounds = true
//        iv.translatesAutoresizingMaskIntoConstraints = false
//        return iv
//    }()
    
    let logoImageView: UIButton = {
        let iv = UIButton()
        iv.contentMode = .scaleAspectFill
        iv.layer.cornerRadius = 50
//        iv.image = UIImage(named: "avatar")
        iv.setImage(#imageLiteral(resourceName: "avatar"), for: .normal)
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.addTarget(self, action: #selector(profileImageHandler), for: .touchUpInside)
        return iv
    }()
    
    func profileImageHandler(_ sender: UIButton) {
        picker.allowsEditing = true
        picker.sourceType = .photoLibrary
        picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
//        picker.modalPresentationStyle = .popover
        present(picker, animated: true)
        
//        let chosenImage = UIImagePickerControllerOriginalImage as? UIImage
//        var  chosenImage = UIImage()
//        chosenImage  = UIImagePickerControllerOriginalImage as! UIImage //2
//        logoImageView.setImage(chosenImage, for: .normal)
    }
    

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        print("Something went +")
    
        dismiss(animated:true, completion: nil) //5
        var chosenImage = UIImage()
        chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage //2
        logoImageView.contentMode = .scaleAspectFit //3
        logoImageView.setImage(chosenImage, for: .normal)
    }
    
//    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
//        let image = info[UIImagePickerControllerOriginalImage] as? UIImage
//        logoImageView.contentMode = .scaleAspectFit
//        logoImageView.setImage(image, for: .normal)
////        uploadImage(image!)
//    }
//    
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("Something went -")
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

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = UIColor.rgb(255, 255, 255)
        setupCollectionView()
    }
    
    func showTutorial() {
        let layout = UICollectionViewFlowLayout()

        let dummySettingsViewController = HowController(collectionViewLayout : layout)
        //se si vuole transizione da destra ---- mettere anche aniamted nel present() a false
//        let transition = CATransition()
//        transition.duration = 0.5
//        transition.type = kCATransitionPush
//        transition.subtype = kCATransitionFromRight
//        view.window!.layer.add(transition, forKey: kCATransition)
        self.present(dummySettingsViewController, animated:true, completion:nil)
    }
    
    func setupCollectionView() {
        view.addSubview(logoImageView)
        view.addSubview(adressTextField)
        view.addSubview(numberTextField)
        view.addSubview(countryTextField)
        view.addSubview(cityTextField)
        view.addSubview(descriptionLabel)
        view.addSubview(actionButton)
        
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
        
        _ = actionButton.anchor(nil, left: nil, bottom: view.bottomAnchor, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: HEIGHT*8, rightConstant: 0, widthConstant: WIDTH*50, heightConstant: HEIGHT*7)
            actionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        

        
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


