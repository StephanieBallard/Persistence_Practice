//
//  CarListingsViewController.swift
//  CarDealer
//
//  Created by Kenny on 3/27/20.
//  Copyright © 2020 Hazy Studios. All rights reserved.
//

import UIKit

class CarListingsViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!

    var carController = CarController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let fusion = Car(id: UUID(), engine: .v6, wheels: 3, make: .ford, model: .fusion, body: .plexiglass, price: 1000)
        carController.addCar(car: fusion)
        collectionView.delegate = self
        collectionView.dataSource = self
        //startCars()
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }

    // MARK: - Methods
//    func startCars() {
//        for car in carArr {
//            car.start()
//        }
//    }
}

extension CarListingsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return carController.cars.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView
            .dequeueReusableCell(withReuseIdentifier: "VehicleCell",
                                 for: indexPath) as? VehicleCollectionViewCell
            else { fatalError("There's no cell with that identifier. Check your storyboard") }
        cell.car = carController.cars[indexPath.item]
        return cell
    }
}
