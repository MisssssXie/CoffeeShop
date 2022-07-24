//
//  Coffee.swift
//  CoffeeShop
//
//  Created by Sally Xie on 2022/7/24.
//

import Foundation

struct Coffee {
    let name: String
    let imageUurl: String
    let price: Double
}

extension Coffee {
    
    static func all() -> [Coffee] {
        return [Coffee(name: "Cappuccino", imageUurl: "Cappuccino", price: 50),
                Coffee(name: "Expresso", imageUurl: "Expresso", price: 99),
                Coffee(name: "Regular", imageUurl: "Regular", price: 40)
        ]
    }
}

