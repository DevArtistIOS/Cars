//
//  SaveCoreDataService.swift
//  CarsTest - CoreData
//
//  Created by dream.one on 25.11.2020.
//  Copyright © 2020 Yura Fomin. All rights reserved.
//

import UIKit
import CoreData

class CoreDataService {
    
    // MARK: Save Data
    func saveData(model: String,
                  bodyType: String,
                  dateCar: String,
                  mileage: String,
                  capacity: String,
                  fuel: String,
                  transmission: String,
                  price: String,
                  image: UIImage,
                  comleted: Bool = false,
                  managedContext : NSManagedObjectContext,
                  completion: @escaping (Result<Bool, Error>)->()) {
        
        guard let entity = NSEntityDescription.entity(forEntityName: "Car", in: managedContext)
            else { return }
        let carEntity = Car(entity: entity, insertInto: managedContext)
        
        carEntity.model = model
        carEntity.bodyType = bodyType
        carEntity.dateCar = dateCar
        carEntity.mileage = mileage
        carEntity.capacity = capacity
        carEntity.fuel = fuel
        carEntity.transmission = transmission
        carEntity.price = price
        carEntity.completed = comleted
        carEntity.imageData = image.pngData()
        
        do {
            try managedContext.save()
            completion(.success(true))
        } catch {
            completion(.success(false))
        }
    }
    
    // MARK: Edit Data
    func editCar(_ car: Car,
                 newModel: String,
                 newBodyType: String,
                 newDateCar: String,
                 newMileage: String,
                 newCapacity: String,
                 newFuel: String,
                 newTransmission: String,
                 newPrice: String,
                 newImage: UIImage?,
                 newComleted: Bool = false,
                 managedContext : NSManagedObjectContext) {
 
        do {
            car.model = newModel
            car.bodyType = newBodyType
            car.dateCar = newDateCar
            car.mileage = newMileage
            car.capacity = newCapacity
            car.fuel = newFuel
            car.transmission = newTransmission
            car.price = newPrice
            car.imageData = newImage?.pngData()
            car.completed = newComleted
            
            try managedContext.save()
        } catch let err {
            print(err.localizedDescription)
        }
    }
    
    // MARK: Fetch Data
    func fetchCars(managedContext : NSManagedObjectContext,
                   completion: @escaping (Result<[Car], Error>)->Void ) {
        
        let fetch : NSFetchRequest<Car> = Car.fetchRequest()
        
        do {
            let cars = try managedContext.fetch(fetch)
            completion(.success(cars))
        } catch {
            completion(.failure(error))
        }
    }
    
}
