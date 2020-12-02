//
//  TextField + Extension.swift
//  CarsTest - CoreData
//
//  Created by dream.one on 26.11.2020.
//  Copyright © 2020 Yura Fomin. All rights reserved.
//

import UIKit

extension UITextField {
    
    static func setTextField(placeholder: String,
    textAutocapitalizationType: UITextAutocapitalizationType) -> UITextField {
        let tf = UITextField()
        tf.placeholder = placeholder
        tf.borderStyle = .none
        tf.autocapitalizationType = textAutocapitalizationType
        tf.textColor = .black
        return tf
    }
}
