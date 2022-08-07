//
//  AddCoffeeOrderViewModel.swift
//  CoffeeShop
//
//  Created by Sally Xie on 2022/7/27.
//

import Foundation

class AddCoffeeOrderViewModel: ObservableObject {
    var name: String = "test"
    @Published var coffeeName: String = ""
    @Published var size: String = "Medium"
    
    var coffeeList: [CoffeeViewModel] {
        return Coffee.all().map { CoffeeViewModel(coffee: $0) }
    }
    
    let repo: CoffeeRepository
    
    var total: Double {
        return calculateTotalPrice()
    }
    
    init() {
        repo = CoffeeRepository()
    }
    
    func placeOrder() {
        
        let order = Order(name: self.name, coffeeName: self.coffeeName, total: self.total, size: self.size)
        
        self.repo.createCoffeeOrder(order: order) { _ in
            print("success")
        }
       
    }
    
    private func priceForSize() -> Double {
        let prices = ["Small":2.0, "Medium":3.0, "Large":4.0]
        return prices[self.size]!
    }
    
    private func calculateTotalPrice() -> Double {
        let coffeeVM = coffeeList.first {$0.name == coffeeName}
        if let coffeeVM = coffeeVM {
            return coffeeVM.price * priceForSize()
        } else {
            return 0.0
        }
    }
}
