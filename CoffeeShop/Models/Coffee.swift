//
//  Coffee.swift
//  CoffeeShop
//
//  Created by Sally Xie on 2022/7/24.
//

import Foundation

struct Coffee {
    let name: String
    let imageUrl: String
    let price: Double
}

extension Coffee {
    
    static func all() -> [Coffee] {
        return [Coffee(name: "Cappuccino", imageUrl: "Cappuccino", price: 50),
                Coffee(name: "Expresso", imageUrl: "Expresso", price: 99),
                Coffee(name: "Regular", imageUrl: "Regular", price: 40)
        ]
    }
}

