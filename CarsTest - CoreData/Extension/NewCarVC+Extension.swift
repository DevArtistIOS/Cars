//
//  TextFieldDelegateExtension.swift
//  CarsTest - CoreData
//
//  Created by dream.one on 25.11.2020.
//  Copyright © 2020 Yura Fomin. All rights reserved.
//

import UIKit

    // MARK: -UITextFieldDelegate
extension NewCarViewController :  UITextFieldDelegate {
    
    func textFieldDelegate() {
        let array = [someView.modelTextField,
                     someView.dateTextField,
                     someView.fuelTextField,
                     someView.mileageTextField,
                     someView.bodyTextField,
                     someView.capacityTextField,
                     someView.transmissionTextField,
                     someView.priceTextField]
        
        for tf in array {
            tf.delegate = self
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
        return true
       }
    
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {

            let text = (textField.text! as NSString).replacingCharacters(in: range, with: string)
            if !text.isEmpty{
                saveBarBtn.isEnabled = true
            } else {
                saveBarBtn.isEnabled = false
            }
            return true
        }
    
}
