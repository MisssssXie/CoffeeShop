//
//  CoffeeReoo.swift
//  CoffeeShop
//
//  Created by Sally Xie on 2022/7/24.
//

import Foundation

class CoffeeRepository {
    
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
