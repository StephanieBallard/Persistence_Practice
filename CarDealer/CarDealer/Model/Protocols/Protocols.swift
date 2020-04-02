//
//  Protocols.swift
//  CarDealer
//
//  Created by Kenny on 3/27/20.
//  Copyright © 2020 Hazy Studios. All rights reserved.
//
import UIKit

protocol Vehicle {
    var make: Make { get }
    var model: Model { get }
    var body: Body { get set }
    var price: Int? { get set }
}

protocol Drivable: Vehicle {
    var engine: Engine { get }
    var wheels: Int { get set }
}

//default implementation using extension!
extension Vehicle {
    private var driveable: Bool {
        self is Drivable
    }

    func start() {
        if driveable {
            print("Starting the \(make.rawValue) \(model.rawValue)\nVroom")
        }  else {
            print("I have no engine!")
        }
    }

}

//Day 1 Stretch 1: check to see how many wheels vehicle has in driveable check

