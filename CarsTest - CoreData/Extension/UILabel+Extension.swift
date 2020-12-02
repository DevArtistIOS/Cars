//
//  UILabel + Extension.swift
//  CarsTest - CoreData
//
//  Created by dream.one on 26.11.2020.
//  Copyright © 2020 Yura Fomin. All rights reserved.
//

import UIKit

extension UILabel {
    
    static func setTitleLabel(text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }
}
