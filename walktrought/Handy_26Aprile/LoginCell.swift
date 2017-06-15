

import UIKit

class LoginCell: UICollectionViewCell, UITextFieldDelegate {
    
    
    let logoImageView: UIImageView = {
        let image = UIImage(named: "logo")
        let imageView = UIImageView(image: image)
        return imageView
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
    
    let loginButton = Constant.GlobalConstants.loginButton
    
//    func showMainNavigation() {
//        let layout = UICollectionViewFlowLayout()
//        let dummySettingsViewController = MainNavigationController(collectionViewLayout : layout)
//        let transition = CATransition()
//        transition.duration = 0.3
//        transition.type = kCATransitionPush
//        transition.subtype = kCATransitionFromRight
//        window!.layer.add(transition, forKey: kCATransition)
//        self.present(dummySettingsViewController, animated:false, completion:nil)
//    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        addSubview(logoImageView)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(forgotPasswordButton)
        addSubview(loginButton)
        addSubview(facebookButton)
        addSubview(createAccountButton)
        
        _ = logoImageView.anchor(centerYAnchor, left: nil, bottom: nil, right: nil, topConstant: -230, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 100, heightConstant: 100)
        logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        _ = emailTextField.anchor(logoImageView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 32, leftConstant: 32, bottomConstant: 0, rightConstant: 32, widthConstant: 0, heightConstant: 50)
        
        _ = passwordTextField.anchor(emailTextField.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 16, leftConstant: 32, bottomConstant: 0, rightConstant: 32, widthConstant: 0, heightConstant: 50)
        
         _ = forgotPasswordButton.anchor(passwordTextField.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 16, leftConstant: 50, bottomConstant: 0, rightConstant: 50, widthConstant: 0, heightConstant: 50)
        
        _ = loginButton.anchor(forgotPasswordButton.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 25, leftConstant: 32, bottomConstant: 0, rightConstant: 100, widthConstant: 0, heightConstant: 50)
        
        _ = facebookButton.anchor(forgotPasswordButton.bottomAnchor, left: loginButton.rightAnchor, bottom: nil, right: nil, topConstant: 25, leftConstant: 15, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
        
        _ = createAccountButton.anchor(nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 32, bottomConstant: 70, rightConstant: 32, widthConstant: 0, heightConstant: 0)
        
        
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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








