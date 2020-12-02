//
//  NewCarView.swift
//  CarsTest - CoreData
//
//  Created by dream.one on 25.11.2020.
//  Copyright © 2020 Yura Fomin. All rights reserved.
//

import UIKit

class NewCarView : UIView {
    
    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupUIConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Public Properties
    let stackView = UIStackView()
    let stackViewTextField = UIStackView()
    
    // MARK: Setup View
    func setupView() {
        self.backgroundColor = .white
        self.addSubview(modelTextField)
        self.addSubview(bodyTextField)
        self.addSubview(dateTextField)
        self.addSubview(mileageTextField)
        self.addSubview(capacityTextField)
        self.addSubview(fuelTextField)
        self.addSubview(transmissionTextField)
        self.addSubview(priceTextField)
        
        self.addSubview(modelLabel)
        self.addSubview(bodyLabel)
        self.addSubview(dateLabel)
        self.addSubview(mileageLabel)
        self.addSubview(capacityLabel)
        self.addSubview(fuelLabel)
        self.addSubview(transmissionLabel)
        self.addSubview(priceLabel)
        
        self.addSubview(imageView)
    }
    
    // MARK: Properties
    let modelTextField = UITextField.setTextField(
        placeholder: "Введите модель", textAutocapitalizationType: .sentences)

    let bodyTextField = UITextField.setTextField(
        placeholder: "Введите тип кузова", textAutocapitalizationType: .sentences)

    let dateTextField = UITextField.setTextField(
        placeholder: "Введите год выпуска", textAutocapitalizationType: .sentences)
    
    let mileageTextField = UITextField.setTextField(
        placeholder: "Введите пробег", textAutocapitalizationType: .sentences)
    
    let capacityTextField = UITextField.setTextField(
        placeholder: "Введите объем", textAutocapitalizationType: .sentences)
    
    let fuelTextField = UITextField.setTextField(
        placeholder: "бензин/дизель", textAutocapitalizationType: .none)
    
    let transmissionTextField = UITextField.setTextField(
        placeholder: "механика/автомат", textAutocapitalizationType: .none)
    
    let priceTextField = UITextField.setTextField(
        placeholder: "Введите цену", textAutocapitalizationType: .sentences)

    let modelLabel        = UILabel.setTitleLabel(text: "Марка:")
    let bodyLabel         = UILabel.setTitleLabel(text: "Тип кузова:")
    let dateLabel         = UILabel.setTitleLabel(text: "Год выпуска:")
    let mileageLabel      = UILabel.setTitleLabel(text: "Пробег, тыс.км:")
    let capacityLabel     = UILabel.setTitleLabel(text: "Объем, л:")
    let fuelLabel         = UILabel.setTitleLabel(text: "Тип топлива:")
    let transmissionLabel = UILabel.setTitleLabel(text: "Трансмиссия:")
    let priceLabel        = UILabel.setTitleLabel(text: "Цена, руб:")
    

    var imageView : UIImageView = {
       let image = UIImageView()
        image.backgroundColor = .lightGray
        image.image = UIImage(named: "add")
        image.layer.cornerRadius = 15
        image.contentMode = .scaleAspectFit
        return image
    }()
    
   
}


