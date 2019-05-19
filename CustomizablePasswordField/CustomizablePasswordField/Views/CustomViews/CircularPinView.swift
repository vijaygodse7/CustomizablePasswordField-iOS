//
//  CircularPinView.swift
//  CustomizablePasswordField
//
//  Created by Vijay Godse on 5/18/19.
//

import UIKit

class CircularPinView: UIView, PinViewConfigurable {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        rounded()
    }

    func rounded() {
        layer.cornerRadius = frame.width / 2
        layer.borderWidth = 1
        layer.borderColor = pinborderColor
        backgroundColor = pinclearColor

    }
    
    func clearView() {
        backgroundColor = pinclearColor
    }
    
    func fillView() {
        backgroundColor = pinfillColor
    }
}
