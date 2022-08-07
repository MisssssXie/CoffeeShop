//
//  CoffeeListVIew.swift
//  CoffeeShop
//
//  Created by Sally Xie on 2022/7/24.
//

import SwiftUI

struct CoffeeListView: View {
    
    
    let orders: [OrderViewModel]
    
    init(orders: [OrderViewModel]) {
        self.orders = orders
    }
    
    var body: some View {
        List {
            ForEach(orders, id: \.id) { order in
                HStack {
                    Image(order.coffeeName)
                        .resizable()
                        .frame(width: 100, height: 100)
                        .cornerRadius(50)
                    VStack(alignment: .leading) {
                        Text(order.name)
                            .font(.title)
                            .padding([.leading, .bottom], 10)
                        HStack {
                            Text(order.coffeeName)
                                .font(.body)
                                .padding(.all, 10)
                                .background(Color.pink)
                                .foregroundColor(Color.white)
                                .cornerRadius(10)
                            Text(order.size)
                                .padding(.all, 10)
                                .background(Color.blue)
                                .foregroundColor(Color.white)
                                .cornerRadius(10)
                        }
                        
                        
                    }
                    
                }
            }
        }.listStyle(.inset)
    }
}

struct CoffeeListVIew_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeListView(orders: [
            OrderViewModel(Order(name: "John Doe", coffeeName: "Cappuccino", total: 4.5, size: "Medium")),
            OrderViewModel(Order(name: "Sally", coffeeName: "Expresso", total: 445, size: "Normal"))
        
        ])
    }
}
