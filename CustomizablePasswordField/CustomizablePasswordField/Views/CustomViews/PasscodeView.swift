//
//  PasswordView.swift
//  CustomizablePasswordField
//
//  Created by Vijay Godse on 5/18/19.
//

import UIKit

public protocol PasswordViewDelegate: class {
    func didFinishEntering(password: String)
    func didDeleteBackwardPin()
}

public class PasswordView: UIView {
    
    /*
     Password stackview that can be used to add pins.
     */
    private let passwordStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    private let passwordContentView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var contentView: UIView?
    private var passwordText = String()
    
    public weak var delegate: PasswordViewDelegate?
    public var keyboardType: UIKeyboardType = .numberPad
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        setup()
    }
    
    private func setup() {
        if (contentView == nil) {
            
            contentView = passwordContentView
            contentView?.frame = bounds
            guard let view = contentView else {return}
            addSubview(view)
    
            let _ = becomeFirstResponder()
            setupPasswordStackView()
        }
        
    }
}

extension PasswordView: PasswordConfigurable {
    
    private func setupPasswordStackView() {
        
        self.addSubview(passwordStackView)
        
        placeHolderViews.forEach { (view) in
            passwordStackView.addArrangedSubview(view)
        }
        
        passwordStackView.spacing = customSpacing
        
        passwordStackView.translatesAutoresizingMaskIntoConstraints = false
        passwordStackView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        passwordStackView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
//        guard 0..<length ~= customSpacingPosition else { return }
        passwordStackView.distribution = .fillEqually
        passwordStackView.alignment = .center
//        passwordStackView.setCustomSpacing(CGFloat(customSpacing),
//                                           after: passwordStackView.arrangedSubviews[customSpacingPosition])
    }
    
    private var placeHolderViews: [PinView] {
        var views = [PinView]()
        for _ in 0..<length {
            let pinView: PinView = PinView()
            views.append(pinView)
        }
        return views
    }
    
    public func clear() {
        UIView.animate(withDuration: 0.3) {
            self.passwordStackView.arrangedSubviews.forEach { (view) in
                if let pinView = view as? PinView {
                    pinView.update(fill: false, andText: nil, isSecureEntry: self.isSecureEntry)
                }
            }
            self.passwordText.removeAll()
        }
    }
}

extension PasswordView: UIKeyInput {
    
    override public var canBecomeFirstResponder: Bool {
        return true
    }
    
    override public func becomeFirstResponder() -> Bool {
        return super.becomeFirstResponder()
    }
    
    public var hasText: Bool {
        return !passwordText.isEmpty
    }
    
    public func insertText(_ text: String) {
        guard canInsertCharacters() else { return }
        passwordText.append(text)
        
        guard let view = passwordStackView.arrangedSubviews.filter({ (view) -> Bool in
            if let pinView = view as? PinView,
                pinView.isEmpty() {
                return true
            }
            return false
        }).first as? PinView else { return }
        
        view.update(fill: true, andText: text, isSecureEntry: isSecureEntry)
        
        if passwordText.count == length {
            delegate?.didFinishEntering(password: passwordText)
        }
    }
    
    public func deleteBackward() {
        guard hasText else { return }
        
        passwordText.removeLast()
        delegate?.didDeleteBackwardPin()
        
        guard let view = passwordStackView.arrangedSubviews.filter({ (view) -> Bool in
            if let pinView = view as? PinView,
                !pinView.isEmpty() {
                return true
            }
            return false
        }).last as? PinView else { return  }
        
        view.update(fill: false, andText: nil, isSecureEntry: isSecureEntry)
    }
    
    private func canInsertCharacters() -> Bool {
        return passwordText.count != length
    }
}
