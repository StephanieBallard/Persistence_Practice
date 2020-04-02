//
//  Car.swift
//  CarDealer
//
//  Created by Kenny on 3/28/20.
//  Copyright © 2020 Hazy Studios. All rights reserved.
//

import Foundation

// Enums do not coform to decodable
struct Car: Drivable, Codable {
    var id: UUID
    var engine: Engine
    var wheels: Int
    var make: Make
    var model: Model
    var body: Body
    var price: Int?
}

extension Car: Equatable {
    static func == (lhs: Car, rhs: Car) -> Bool {
        lhs.id == rhs.id
    }
}
//Stretch 2: Use a failable initializer to complete stretch 1
//Hint: This can be implemented in a similar fashion to the way the String initializer is for the Int type

/***Maybe find a way to do this in Vehicle or Drivable instead!***/
//    in Car:
//    init(engine: Engine, wheels: Int, make: Make, model: Model, body: Body, price: Int) {
//        self.engine = engine
//        self.wheels = wheels
//        self.make = make
//        self.model = model
//        self.body = body
//        self.price = price
//    }
//
//    init?(drivable: Drivable) {
//        self.init(engine: drivable.engine, wheels: drivable.wheels, make: drivable.make, model: drivable.model, body: drivable.body, price: drivable.price ?? 1000)
//        if self.wheels < 4 {
//            return nil
//        }
//    }
