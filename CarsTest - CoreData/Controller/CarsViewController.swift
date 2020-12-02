//
//  ViewController.swift
//  CarsTest - CoreData
//
//  Created by dream.one on 23.11.2020.
//  Copyright © 2020 Yura Fomin. All rights reserved.
//

import UIKit
import CoreData

class CarsViewController: UIViewController {
    
    // MARK: Public Prorerties
    var coreDataManager = CoreDataService()
    var managedContext : NSManagedObjectContext!
    
    // MARK: Private Prorerties
    private let tableView : UITableView = {
       let tbv = UITableView()
        tbv.register(CarsTableViewCell.self,
                     forCellReuseIdentifier: CarsTableViewCell.cellId)
        tbv.tableFooterView = UIView()
        return tbv
    }()
    
    private var tableViewHeight : CGFloat = 390
    
    // MARK: UIBarButtonItem
   lazy var addNewCarBtn = UIBarButtonItem(
        barButtonSystemItem: .add,
        target: self,
        action: #selector(addNewCar))
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        navigationController()
        }
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchData()
    }
    
    // MARK: Selector UIBarButtonItem
    @objc func addNewCar() {
        let controller = NewCarViewController()
        controller.isEditing = true
        controller.managedContext = self.managedContext
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    // MARK: Fetch Data
    private func fetchData() {
        coreDataManager.fetchCars(managedContext: managedContext) { (result) in
            switch result {
            case .success(let carVariable):
                Service.cars = carVariable
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let err as NSError):
                print(err.localizedDescription)
            }
        }
    }
    
}

    // MARK: - Setup TableView and Navigation
extension CarsViewController {

   private func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
//        tableView.tableFooterView = UIView()
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func navigationController() {
        self.navigationItem.title = "Автомобили"
        self.navigationItem.rightBarButtonItem = addNewCarBtn
    }
    
}


    // MARK: - UITableViewDataSource
extension CarsViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Service.cars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CarsTableViewCell.cellId, for: indexPath) as! CarsTableViewCell
        let car = Service.cars[indexPath.row]
        cell.setupCell(car)
        return cell
    }
    
}

    // MARK: - UITableViewDelegate
extension CarsViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let car = Service.cars[indexPath.row]
        let controller = NewCarViewController()
        controller.isEditing = false
        controller.managedContext = self.managedContext
        controller.car = car
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableViewHeight
    }
    
    // MARK: Добавление функции удаления в ячейке
    func tableView(_ tableView: UITableView,
                   editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView,
                   commit editingStyle: UITableViewCell.EditingStyle,
                   forRowAt indexPath: IndexPath) {
        let list = Service.cars[indexPath.row]
        if editingStyle == .delete {
            managedContext.delete(list)
            Service.cars.remove(at: indexPath.row)
            
            do {
                try managedContext.save()
                self.tableView.deleteRows(at: [indexPath], with: .left)
                self.tableView.reloadData()
            } catch let err as NSError {
                print(err.localizedDescription)
            }
        }
    }
    
}



