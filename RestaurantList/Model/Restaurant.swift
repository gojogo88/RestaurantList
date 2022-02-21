//
//  Restaurant.swift
//  RestaurantList
//
//  Created by Jonathan Go on 21.02.22.
//

import Foundation

struct Restaurant: Decodable {
    let name: String
    let cuisine: Cuisine
}

enum Cuisine: String, Decodable {
    case european
    case indian
    case mexican
    case french
    case english
}
