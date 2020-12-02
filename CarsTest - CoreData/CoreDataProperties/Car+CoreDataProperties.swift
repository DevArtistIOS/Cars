//
//  Car+CoreDataProperties.swift
//  CarsTest - CoreData
//
//  Created by dream.one on 25.11.2020.
//  Copyright © 2020 Yura Fomin. All rights reserved.
//
//

import Foundation
import CoreData


extension Car {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Car> {
        return NSFetchRequest<Car>(entityName: "Car")
    }

    @NSManaged public var bodyType: String?
    @NSManaged public var completed: Bool
    @NSManaged public var dateCar: String?
    @NSManaged public var imageData: Data?
    @NSManaged public var model: String?
    @NSManaged public var mileage: String?
    @NSManaged public var capacity: String?
    @NSManaged public var fuel: String?
    @NSManaged public var price: String?
    @NSManaged public var transmission: String?

}
