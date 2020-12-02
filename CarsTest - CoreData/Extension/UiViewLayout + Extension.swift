//
//  Extension.swift
//  CarsTest - CoreData
//
//  Created by dream.one on 24.11.2020.
//  Copyright © 2020 Yura Fomin. All rights reserved.
//

import Foundation
import UIKit

    // MARK: Setup Layout
extension NewCarView {
    
    func setupUIConstraints() {
        configurateStackView()
        setupImageView()
    }
    
    func setupImageView() {
           self.addSubview(imageView)
           imageView.translatesAutoresizingMaskIntoConstraints = false
           imageView.topAnchor.constraint(
            equalTo: stackView.bottomAnchor,
            constant: 30).isActive = true
           imageView.centerXAnchor.constraint(
            equalTo: self.centerXAnchor).isActive = true
           imageView.heightAnchor.constraint(
            equalToConstant: self.frame.height/3).isActive = true
           imageView.leadingAnchor.constraint(
            equalTo: self.safeAreaLayoutGuide.leadingAnchor,
            constant: 10).isActive = true
           imageView.trailingAnchor.constraint(
            equalTo: self.safeAreaLayoutGuide.trailingAnchor,
            constant: -10).isActive = true
       }
    
     func configurateStackView() {
        stackView.axis         = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing      = 20
        
        stackViewTextField.axis         = .vertical
        stackViewTextField.distribution = .fillEqually
        stackViewTextField.spacing      = 20
        
        self.addSubview(stackView)
        self.addSubview(stackViewTextField)
        addItemLabelOnStackView()
        addItemTextFieldOnStackView()
        setLabelStackViewConstraints()
        setTextFeildStackViewConstraints()
    }
    
     private func addItemLabelOnStackView() {
        stackView.addArrangedSubview(modelLabel)
        stackView.addArrangedSubview(bodyLabel)
        stackView.addArrangedSubview(dateLabel)
        stackView.addArrangedSubview(mileageLabel)
        stackView.addArrangedSubview(capacityLabel)
        stackView.addArrangedSubview(fuelLabel)
        stackView.addArrangedSubview(transmissionLabel)
        stackView.addArrangedSubview(priceLabel)
    }
    
     private func addItemTextFieldOnStackView() {
        stackViewTextField.addArrangedSubview(modelTextField)
        stackViewTextField.addArrangedSubview(bodyTextField)
        stackViewTextField.addArrangedSubview(dateTextField)
        stackViewTextField.addArrangedSubview(mileageTextField)
        stackViewTextField.addArrangedSubview(capacityTextField)
        stackViewTextField.addArrangedSubview(fuelTextField)
        stackViewTextField.addArrangedSubview(transmissionTextField)
        stackViewTextField.addArrangedSubview(priceTextField)
    }
    
     private func setLabelStackViewConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(
            equalTo: self.safeAreaLayoutGuide.leadingAnchor,
            constant: 10).isActive = true
        stackView.topAnchor.constraint(
            equalTo: self.safeAreaLayoutGuide.topAnchor,
            constant: 30).isActive = true
    }
    
    private func setTextFeildStackViewConstraints() {
        stackViewTextField.translatesAutoresizingMaskIntoConstraints = false
        stackViewTextField.leadingAnchor.constraint(
            equalTo: stackView.trailingAnchor,
            constant: 20).isActive = true
        stackViewTextField.topAnchor.constraint(
            equalTo: self.safeAreaLayoutGuide.topAnchor,
            constant: 30).isActive = true
    }
}

