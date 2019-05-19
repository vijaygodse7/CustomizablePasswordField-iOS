//
//  PasswordViewController.swift
//  CustomizablePasswordField
//
//  Created by Vijay Godse on 5/18/19.
//

import UIKit

class PasswordViewController: UIViewController {
    
    private var passwordView: PasswordView = {
        let view = PasswordView(frame: CGRect(x: 0, y: 0, width: 0, height: 30))
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var descLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.textAlignment = NSTextAlignment.center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpVC()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setUpUIFields()
    }
    
    private func setUpVC() {
        //set view controller's background color
        view.backgroundColor = .white
        
        //Add nav bar title
        self.title = "passwordVC.title".localized
        
        //Setting PasswordView delegate
        passwordView.delegate = self
        
    }
    
    private func setUpUIFields() {
        addDescriptionLabelWithConstraints()
        addPasswordViewWithConstraints()
        customizePasswordView()
    }
    
    private func addDescriptionLabelWithConstraints() {
        self.view.addSubview(descLabel)
        
        let guide = self.view.safeAreaLayoutGuide
        descLabel.topAnchor.constraint(equalTo:  guide.topAnchor, constant: 50).isActive = true
        descLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        descLabel.widthAnchor.constraint(equalToConstant: (view.frame.width - 50)).isActive = true
        descLabel.text = "passwordVC.labelDesc".localizeWithFormat(arguments: "4")
    }
    
    private func addPasswordViewWithConstraints() {
        self.view.addSubview(passwordView)
        passwordView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passwordView.topAnchor.constraint(equalTo:  descLabel.bottomAnchor, constant: 40).isActive = true
        passwordView.heightAnchor.constraint(equalToConstant: passwordView.frame.height).isActive = true
        passwordView.widthAnchor.constraint(equalToConstant: view.frame.width - 50).isActive = true
    }
    
    //Customize password view with properties like length
    private func customizePasswordView() {
        
        //Set isSecureEntry true if wants to visible pin, o.w. set false
        passwordView.isSecureEntry = true

        //set password length
        setPasswordLength()
        
        //Set keyboard type for
        passwordView.keyboardType = .numberPad
        
        //Customize space between pins
        passwordView.customSpacing = 10

        //Set password pin border color
        passwordView.pinborderColor = UIColor.clear.cgColor
        
        //Set password pin indicator color if password pin is entered
        passwordView.pinfillColor = UIColor.pinSelected
        
        //Set password pin indicator color if password pin is cleared or empty
        passwordView.pinclearColor = UIColor.pinDeselected
        
        //Customize navigation bar tint and title color
        passwordView.updateNavigationBarColor(barTintColor: .navBarColor, titleColor: .white)
        
    }
    
    private func setPasswordLength() {
        let passwordLength = 6
        passwordView.length = passwordLength
        updateDescText(passwordLength: passwordLength)
    }
    
    private func updateDescText(passwordLength: Int) {
        descLabel.text = "passwordVC.labelDesc".localizeWithFormat(arguments: passwordLength.description)
    }


}


extension PasswordViewController: PasswordViewDelegate {
    
    func didFinishEntering(password: String) {
        //Do anything with entered password
        print(password)
    }
    
    func didDeleteBackwardPin() {
        //Do anything on pin deleted
    }
    
    
}
