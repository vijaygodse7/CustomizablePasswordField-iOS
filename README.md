# CustomizablePasswordField-iOS

## Requirements
- XCode 9.3+
- iOS 11.0+
- Swift 4.2+

An iOS application, It includes password field UI which is customizable.

## Customizable Properties

- secureEntry - Make password entry either secure or not.
- length -  Password Pin length. The pin indicators will be shown based on this property.
- keyboardType - Set input keyboard type
- defaultSpacing - Spacing between each pin.
- pinfillColor - Pin fill color when pin entry is entered.
- pinclearColor - Pin clear color when pin entry is removed/not entered.
- pinborderColor - Pin border color.
- updateNavigationBarColor() - Method to customize navigation bar tint and title color.

## Usage
1. Create PasswordView and add it to UIView.
```
        let passwordView = PasswordView(frame: CGRect(x: 0, y: 0, width: 0, height: 30))
        view.addSubview(passwordView)
```

2. Customize PasswordView
```
   
        //Set isSecureEntry true if wants to visible pin, o.w. set false
        passwordView.isSecureEntry = true

        //set password length
        passwordView.length = 6
        
        //Set keyboard type for password entry
        passwordView.keyboardType = .numberPad
        
        //Customize space between pins
        passwordView.customSpacing = 10

        //Set password pin border color
        passwordView.pinborderColor = UIColor.clear.cgColor
        
        //Set password pin indicator color if password pin is entered
        passwordView.pinfillColor = UIColor.blue
        
        //Set password pin indicator color if password pin is cleared or empty
        passwordView.pinclearColor = UIColor.gray
        
        //Customize navigation bar tint and title color
        passwordView.updateNavigationBarColor(barTintColor: .blue, titleColor: .white)
```
3. Set PasswordView delegate and handle its methods.
```
passwordView.delegate = self


//PasswordViewDelegate methods
extension ViewController: PasswordViewDelegate {
    
    func didFinishEntering(password: String) {
        //Do anything with entered password
    }
    
    func didDeleteBackwardPin() {
        //Do anything on single pin delete
    }    
}

```
