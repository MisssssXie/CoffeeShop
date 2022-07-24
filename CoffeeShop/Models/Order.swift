//
//  Order.swift
//  CoffeeShop
//
//  Created by Sally Xie on 2022/7/24.
//

import Foundation

struct Order: Codable {
    let name: String
    let coffeeName: String
    let total: Double
    let size: String
}
