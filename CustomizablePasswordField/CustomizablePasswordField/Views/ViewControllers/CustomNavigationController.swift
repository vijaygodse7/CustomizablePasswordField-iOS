//
//  CustomNavigationController.swift
//  CustomizablePasswordField
//
//  Created by Vijay Godse on 5/19/19.
//

import UIKit

class CustomNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateNavBar()
    }

    private func updateNavBar() {
        //Set nav bar background color
        UINavigationBar.appearance().barTintColor = .navBarColor
        //Set nav bar text color
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]

    }
    
}
