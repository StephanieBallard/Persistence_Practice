//
//  VehicleCollectionViewCell.swift
//  CarDealer
//
//  Created by Kenny on 3/27/20.
//  Copyright © 2020 Hazy Studios. All rights reserved.
//

import UIKit

class VehicleCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var makeModelLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!

    var car: Car? {
        didSet {
            updateViews()
        }
    }

    func updateViews() {
        guard let makeModel = makeModelLabel,
            let price = priceLabel,
            let car = car
        else { return }
        makeModel.text = "\(car.make.rawValue) \(car.model.rawValue)"
        if let vehiclePrice = car.price {
            price.text = "\(vehiclePrice)"
        }
    }
}
