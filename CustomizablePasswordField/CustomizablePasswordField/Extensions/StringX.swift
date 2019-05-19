//
//  StringX.swift
//  CustomizablePasswordField
//
//  Created by Vijay Godse on 5/20/19.
//

import Foundation

extension String {
    
    func localizeWithFormat(arguments: CVarArg...) -> String{
        return String(format: self.localized, arguments: arguments)
    }
    
    var localized: String {
        return  NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
}

