//
//  CarParts.swift
//  CarDealer
//
//  Created by Kenny on 3/27/20.
//  Copyright © 2020 Hazy Studios. All rights reserved.
//
// Enums do not conform to Decodable, however, if their raw values do, then we can work around that, turn the raw values into strings which does conform to Decodable.
enum Engine: String, Codable {
    case i4 = "Inline-4"
    case i6 = "Inline-6"
    case v6 = "V-6"
    case v8 = "V-8"
    case v10 = "V-10"
    case v12 = "V-12"
}

enum Body: String, Codable {
    case rustedOut = "Rusted Out"
    case steel = "steel"
    case plexiglass = "plexiglass"
    case carbonFiber = "carbon fiber"
}

enum Make: String, Codable {
    case buick = "Buick"
    case ford = "Ford"
}

enum Model: String, Codable {
    case skylark = "Skylark"
    case fusion = "Fusion"
}
