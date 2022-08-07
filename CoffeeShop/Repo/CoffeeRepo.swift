//
//  CoffeeReoo.swift
//  CoffeeShop
//
//  Created by Sally Xie on 2022/7/24.
//

import Foundation

class CoffeeRepository {
    func createCoffeeOrder(order: Order, completion: @escaping (CreateOrderResponse?) -> ()) {
        
        guard let url = URL(string: "https://accurate-plain-saturn.glitch.me/orders") else {
            fatalError("Invalid URL")
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(order)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            
            let createOrderResponse = try? JSONDecoder().decode(CreateOrderResponse.self, from: data)
            DispatchQueue.main.async {
                 completion(createOrderResponse)
            }
        }.resume()
    }
    
    func getAllOrders(completion: @escaping ([Order]?) -> ()) {
        guard let url = URL(string: "https://accurate-plain-saturn.glitch.me/orders") else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if error != nil {
                completion(nil)
                return
            }
            
            guard let data = data else {
                completion(nil)
                return
            }
            
            let decoder = JSONDecoder()
            let orders = try? decoder.decode([Order].self, from: data)
            DispatchQueue.main.async {
                completion(orders)
            }
            
        }.resume()
        
    }
}
