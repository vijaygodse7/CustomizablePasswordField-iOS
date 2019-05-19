//
//  Configurations.swift
//  CustomizablePasswordField
//
//  Created by Vijay Godse on 5/18/19.
//

import Foundation
import UIKit

// Pin Appreance Defaults
private var font                 = UIFont.systemFont(ofSize: 20, weight: .medium)
private var fontColor            = UIColor.black
private var borderColor          = UIColor.clear.cgColor
private var fillColor            = UIColor.pinSelected
private var clearColor            = UIColor.pinDeselected

public protocol PinViewConfigurable {
    var pinfont: UIFont {get set}
    var pinfontColor: UIColor {get set}
    var pinborderColor: CGColor {get set}
    var pinfillColor: UIColor {get set}
}

// extension to set default behaviour for pin view field configurations
public extension PinViewConfigurable {
    var pinfont: UIFont {
        get {
            return font
        }
        set {
            font =  newValue
        }
    }
    
    var pinfontColor: UIColor {
        get {
            return fontColor
        }
        set {
            fontColor =  newValue
        }
    }
    
    var pinborderColor: CGColor {
        get {
            return borderColor
        }
        set {
            borderColor =  newValue
        }
    }
    
    var pinfillColor: UIColor {
        get {
            return fillColor
        }
        set {
            fillColor =  newValue
        }
    }
    
    var pinclearColor: UIColor {
        get {
            return clearColor
        }
        set {
            clearColor =  newValue
        }
    }
}

// Password Appreance Defaults
private var passwordLength                 = 6
private var passwordIsSecureEntry          = true
private var passwordPinCustomSpacing: CGFloat = 5

public protocol PasswordConfigurable: PinViewConfigurable {
    var length: Int {get set}
    var isSecureEntry: Bool {get set}
    var customSpacing: CGFloat {get set}
}


// extension to set default behaviour for password field configurations
public extension PasswordConfigurable {
    var length: Int {
        get {
            return passwordLength
        }
        set {
            passwordLength =  newValue
        }
    }
    
    var isSecureEntry: Bool {
        get {
            return passwordIsSecureEntry
        }
        set {
            passwordIsSecureEntry =  newValue
        }
    }
    
    var customSpacing: CGFloat {
        get {
            return passwordPinCustomSpacing
        }
        set {
            passwordPinCustomSpacing =  newValue
        }
    }
}

