//
//  CarController.swift
//  CarDealer
//
//  Created by Stephanie Ballard on 4/1/20.
//  Copyright © 2020 Hazy Studios. All rights reserved.
//

import Foundation

class CarController {
    
    // MARK: - Properties
    let carsPlist = "Car.plist"
    var cars: [Car] = []
    
    var persistentURL: URL? {
        let documents = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        let url = documents?.appendingPathComponent(carsPlist)
        return url
    }
    
    // MARK: - Init
    
    init() {
        checkPersistence()
    }
    
    // MARK: - Create
    
    func addCar(car: Car) {
        cars.append(car)
        saveToPersistentStore()
    }
    
    // MARK: - READ
    func loadList() {
        guard let url = persistentURL else { return }
        
        do {
            // set up decoder
            let decoder = PropertyListDecoder()
            // when you see throws you need to use try
            let carData = try Data(contentsOf: url)
            // ^ loads url and now we turn it into data that we can decode
            let cars = try decoder.decode([Car].self, from: carData)
            self.cars = cars
            // Put methods in here that can fail or that take awhile.
        } catch let loadError {
            // comes with a free error in the background that we don't see
            print("Error loading Cars file: \(loadError)")
        }
    }
    
    // MARK: - Update
    func updateCar(car: Car) {
        var thisCar = cars.first { (aCar) -> Bool in
            car == aCar
        }
        if thisCar != nil {
            thisCar = car
        }
        saveToPersistentStore()
    }
    
    func saveToPersistentStore() {
        guard let url = persistentURL else { return }
        
        do {
            
            // set up the encoder
            let encoder = PropertyListEncoder()
            let carData = try encoder.encode(self.cars)
            try carData.write(to: url)
            
        } catch let saveError {
            print("Error saving data to Plist: \(saveError)")
        }
    }
    
    // MARK: - Delete
    func deleteCar(car: Car) {
        guard let carIndex = cars.firstIndex(of: car) else { return }
        cars.remove(at: carIndex)
        saveToPersistentStore()
    }
    
    // MARK: - Helper Methods
    func checkPersistence() {
        loadList()
        if cars.isEmpty {
            // Load from Network
        }
    }
}
