//
//  NewCarViewController.swift
//  CarsTest - CoreData
//
//  Created by dream.one on 23.11.2020.
//  Copyright © 2020 Yura Fomin. All rights reserved.
//

import UIKit
import CoreData

class NewCarViewController: UIViewController {
    
    // MARK: UIView
    var someView : NewCarView { return self.view as! NewCarView }
    
    // MARK: Public Prorerties
    var coreDataService = CoreDataService()
    var managedContext : NSManagedObjectContext!
    var car : Car! {
        didSet {
            updateModel(car)
        }
    }
    
    // MARK: Private Prorerties
    private let imagePicker = UIImagePickerController()
  
    // MARK: UIBarButtonItem
    var saveBarBtn = UIBarButtonItem(
        title: "Сохранить",
        style: .done,
        target: self,
        action: #selector(saveCar))
  
    // MARK: - Lifecycle
    override func loadView() {
        self.view = NewCarView(frame: UIScreen.main.bounds)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        touchImage()
        textFieldDelegate()
//        noSaveBtn()
    }
    
    
    func noSaveBtn() {
        if someView.modelTextField.text!.isEmpty {
            saveBarBtn.isEnabled = false
        } else {
            saveBarBtn.isEnabled = true
        }
    }
    
    // MARK: - Touch for Add Image
    private func touchImage() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(touchImageAlert))
        someView.imageView.isUserInteractionEnabled = true
        someView.imageView.addGestureRecognizer(tap)
        imagePicker.delegate = self
    }
    
    
    
    // MARK: Setup Navigation
    func setupNavigation() {
        if isEditing {
            self.navigationItem.title = NavTitle.save.rawValue
        } else {
            self.navigationItem.title = NavTitle.edit.rawValue
        }
        self.navigationItem.rightBarButtonItem = saveBarBtn
        self.view.backgroundColor = .white
    }
    
    
    // MARK: Selector touchImage()
    @objc func touchImageAlert() {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let alertCancel = UIAlertAction(title: "Отмена", style: .default)
        
        let alertPhoto = UIAlertAction(title: "Галерея", style: .default) { (action) in
            self.imagePicker.sourceType = .photoLibrary
            self.present(self.imagePicker, animated: true)
        }
        
        let alertCamera = UIAlertAction(title: "Камера", style: .default) { (action) in
            self.imagePicker.sourceType = .camera
            self.present(self.imagePicker, animated: true)
        }
        
        alert.addAction(alertPhoto)
        alert.addAction(alertCamera)
        alert.addAction(alertCancel)
        self.present(alert, animated: true)
    }
    
    // MARK: Selector saveBarBtn variable
    @objc func saveCar() {
        guard let modelText = someView.modelTextField.text,
            let bodyText = someView.bodyTextField.text,
            let dateText = someView.dateTextField.text,
            let milText = someView.mileageTextField.text,
            let capText = someView.capacityTextField.text,
            let fuelText = someView.fuelTextField.text,
            let transText = someView.transmissionTextField.text,
            let priceText = someView.priceTextField.text,
            let image = someView.imageView.image else { return }
        
        if isEditing {
            // save data
        coreDataService.saveData(model: modelText,
                                 bodyType: bodyText,
                                 dateCar: dateText,
                                 mileage: milText,
                                 capacity: capText,
                                 fuel: fuelText,
                                 transmission: transText,
                                 price: priceText,
                                 image: image,
                                 managedContext: managedContext) { (result) in
                switch result {
                case .success(let finished):
                    if finished {
                        self.navigationController?.popViewController(animated: true)
                    } else {
                        self.alertNoSave()
                    }
                case .failure(let err as NSError):
                    print(err.localizedDescription)
                }
            }
        } else {
            // edit data
            coreDataService.editCar(car,
                                    newModel: modelText,
                                    newBodyType: bodyText,
                                    newDateCar: dateText,
                                    newMileage: milText,
                                    newCapacity: capText,
                                    newFuel: fuelText,
                                    newTransmission: transText,
                                    newPrice: priceText,
                                    newImage: image,
                                    managedContext: managedContext)
            self.navigationController?.popViewController(animated: true)
        }
    }
    
}


    // MARK: -UIImagePickerControllerDelegate
extension NewCarViewController : UIImagePickerControllerDelegate,
UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let imagePicked = info[.originalImage] as? UIImage {
            someView.imageView.image = imagePicked
            someView.imageView.backgroundColor = .clear
        }
        self.dismiss(animated: true, completion: nil)
    }
    
}

    // MARK: -Alert No Save
extension NewCarViewController {
    
    private func alertNoSave() {
        let alert = UIAlertController(title:
                  "", message: "No Save", preferredStyle: .alert)
        let alertOk = UIAlertAction(title: "ок", style: .default)
           alert.addAction(alertOk)
           self.present(alert, animated: true)
    }
    
}
    // MARK: Navigation Title
extension NewCarViewController {
    
    enum NavTitle : String {
        case save = "Добавить авто"
        case edit = "Редактировать авто"
    }
    
}

    // MARK: Uodate variable for editing
extension NewCarViewController {
    
    func updateModel(_ car: Car) {
        someView.modelTextField.text = car.model
        someView.bodyTextField.text = car.bodyType
        someView.dateTextField.text = car.dateCar
        someView.mileageTextField.text = car.mileage
        someView.capacityTextField.text = car.capacity
        someView.fuelTextField.text = car.fuel
        someView.transmissionTextField.text = car.transmission
        someView.priceTextField.text = car.price
        guard let image = car.imageData else { return }
        DispatchQueue.main.async {
            self.someView.imageView.backgroundColor = .clear
            self.someView.imageView.image = UIImage(data: image)
        }
    }
    
}
