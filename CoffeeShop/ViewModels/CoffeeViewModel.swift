//
//  CoffeeViewModel.swift
//  CoffeeShop
//
//  Created by Sally Xie on 2022/7/29.
//

import Foundation

class CoffeeViewModel {
    
    let coffee: Coffee
    
    init(coffee: Coffee) {
        self.coffee = coffee
    }
    
    var name: String {
        return coffee.name
    }
    
    var imageURL: String {
        return coffee.imageUrl
    }
    
    var price: Double {
        return coffee.price
    }
}

