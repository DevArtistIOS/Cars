//
//  CarsTableViewCell.swift
//  CarsTest - CoreData
//
//  Created by dream.one on 23.11.2020.
//  Copyright © 2020 Yura Fomin. All rights reserved.
//

import UIKit
import CoreData

class CarsTableViewCell: UITableViewCell {

    // MARK: Private Properties
    static let cellId = "cell"
    
    private let imageData = UIImageView()
    
    private let titleLabel : UILabel = {
       let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    private let priceLabel : UILabel = {
      let label = UILabel()
       label.textColor = .black
       label.font = UIFont.systemFont(ofSize: 22)
       return label
   }()
    
    private let infoLabel : UILabel = {
       let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    private let mileageLabel : UILabel = {
       let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    // MARK: -Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Setup Cell
    func setupCell(_ car: Car?) {
        guard let car = car,
            let model = car.model,
            let imageCar = car.imageData,
            let date = car.dateCar,
            let price = car.price,
            let capacity = car.capacity,
            let fuel = car.fuel,
            let transmiss = car.transmission,
            let mileage = car.mileage else { return }
        
        titleLabel.text = model + ", " + date
        priceLabel.text = price + " ₽"
        infoLabel.text = capacity + " л, " + fuel + ", " + transmiss
        mileageLabel.text = mileage + " тыс.км"
        DispatchQueue.main.async {
            self.imageData.image = UIImage(data: imageCar)
        }
    }
    
}

    // MARK: Setup Layout for Cell
extension CarsTableViewCell {
    
    func setupLayout() {
        contentView.addSubview(imageData)
        contentView.addSubview(titleLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(infoLabel)
        contentView.addSubview(mileageLabel)
        
        imageData.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        mileageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor,
                                                constant: Constants.averageHeight.rawValue),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                                constant: Constants.normalHeight.rawValue),
            
            imageData.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,
                                           constant: Constants.mimimalHeight.rawValue),
            imageData.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageData.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageData.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,
                                              constant: -100),

            
            priceLabel.topAnchor.constraint(equalTo: imageData.bottomAnchor,
                                            constant: Constants.averageHeight.rawValue),
            priceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                                constant: Constants.normalHeight.rawValue),
            
            infoLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor,
                                           constant: Constants.averageHeight.rawValue),
            infoLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                               constant: Constants.normalHeight.rawValue),
            
            mileageLabel.topAnchor.constraint(equalTo: infoLabel.bottomAnchor,
                                              constant: 5),
            mileageLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                                  constant: Constants.normalHeight.rawValue),
        ])
    }
    
}

    // MARK: Constans for Lyaout
extension CarsTableViewCell {
    enum Constants : CGFloat {
        case mimimalHeight = 5.0
        case averageHeight = 10.0
        case normalHeight = 15.0
    }
}


