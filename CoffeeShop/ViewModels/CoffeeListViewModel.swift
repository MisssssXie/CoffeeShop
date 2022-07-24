//
//  CoffeeListViewModel.swift
//  CoffeeShop
//
//  Created by Sally Xie on 2022/7/24.
//

import Foundation

class OrderListViewModel: ObservableObject {
    
    @Published var orders: [OrderViewModel] = []
    
    lazy var repo: CoffeeRepository = CoffeeRepository()
    
    init() {
        fetch()
    }
    
    func fetch() {
        repo.getAllOrders { orders in
            if let orders = orders {
                self.orders = orders.map {
                    OrderViewModel($0)
                }
            }
        }
    }
}

class OrderViewModel {
    
    let id = UUID()
    
    private let order: Order
    
    init(_ order: Order) {
        self.order = order
    }
    
    var name: String {
        return order.name
    }
    
    var coffeeName: String {
        order.coffeeName
    }
    
    var total: Double {
        order.total
    }
    
    var size: String {
        order.size
    }
}
