//
//  PinView.swift
//  CustomizablePasswordField
//
//  Created by Vijay Godse on 5/18/19.
//

import UIKit

//Pin view default constraints
struct PinViewConstraintConstants {
    static let pinViewWidth: CGFloat       = 30.0
    static let pinViewHeight: CGFloat      = 30.0
    static let pinIndicatorWidth: CGFloat  = 20.0
    static let pinIndicatorHeight: CGFloat = 20.0
}

class PinView: UIView, PinViewConfigurable {
    
    private lazy var circularPinView = CircularPinView()
    private lazy var pinLabel  = UILabel()
    private lazy var isFilled: Bool = false
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: PinViewConstraintConstants.pinViewWidth).isActive = true
        heightAnchor.constraint(equalToConstant: PinViewConstraintConstants.pinViewHeight).isActive = true
        
        addSubview(circularPinView)

        circularPinView.translatesAutoresizingMaskIntoConstraints = false
        circularPinView.widthAnchor.constraint(equalToConstant: PinViewConstraintConstants.pinIndicatorWidth).isActive = true
        circularPinView.heightAnchor.constraint(equalToConstant: PinViewConstraintConstants.pinIndicatorHeight).isActive = true
        circularPinView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        circularPinView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    func isEmpty() -> Bool {
        return !isFilled
    }
    
    func update(fill: Bool, andText: String?, isSecureEntry: Bool) {
        isFilled = fill
        if isSecureEntry {
            if fill {
                circularPinView.fillView()
            } else {
                circularPinView.clearView()
            }

            circularPinView.isHidden = false
            pinLabel.isHidden  = true
        } else {
            guard let text = andText, text.count > 0 else {
                pinLabel.isHidden  = true
                circularPinView.isHidden = false
                return
            }
            addSubview(pinLabel)
            pinLabel.translatesAutoresizingMaskIntoConstraints = false
            pinLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
            pinLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
            
            pinLabel.font = pinfont
            pinLabel.textColor = pinfontColor
            pinLabel.text = andText
            
            pinLabel.isHidden  = false
            circularPinView.isHidden = true
        }
    }
}
