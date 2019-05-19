//
//  PasswordViewController.swift
//  CustomizablePasswordField
//
//  Created by Vijay Godse on 5/18/19.
//

import UIKit

class PasswordViewController: UIViewController {
    
    private var passwordView: PasswordView = {
        let view = PasswordView(frame: CGRect(x: 0, y: 0, width: 0, height: 50))
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var descLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = NSTextAlignment.center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpVC()
        
//        passwordView.delegate = self
        
    }
    
    private func setUpVC() {
        view.backgroundColor = .white
        self.title = "Set PIN"
        addLabel()
        addPasswordView()
    }
    
    private func addLabel() {
        self.view.addSubview(descLabel)
        
        let guide = self.view.safeAreaLayoutGuide
        descLabel.topAnchor.constraint(equalTo:  guide.topAnchor, constant: 50).isActive = true
        descLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        descLabel.widthAnchor.constraint(equalToConstant: (view.frame.width - 50)).isActive = true
        descLabel.text = "Please enter 6-alphanumeric character pin. PIN helps you to login to Application"
        
       
    }
    
    private func addPasswordView() {
        self.view.addSubview(passwordView)
        passwordView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passwordView.topAnchor.constraint(equalTo:  descLabel.bottomAnchor, constant: 40).isActive = true
        passwordView.heightAnchor.constraint(equalToConstant: passwordView.frame.height).isActive = true
        passwordView.widthAnchor.constraint(equalToConstant: view.frame.width - 50).isActive = true
        
        //Customize password view
        passwordView.isSecureEntry = true
        passwordView.length = 8
        passwordView.customSpacing = 10
        passwordView.keyboardType = .default
        passwordView.pinborderColor = UIColor.clear.cgColor
        passwordView.pinfillColor = UIColor.pinSelected
        passwordView.pinclearColor = UIColor.pinDeselected
    }


}

