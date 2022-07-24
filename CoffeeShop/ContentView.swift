//
//  ContentView.swift
//  CoffeeShop
//
//  Created by Sally Xie on 2022/7/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var vm = OrderListViewModel()
    
    var body: some View {
        NavigationView {
            CoffeeListView(orders: vm.orders)
            
                .navigationTitle("Coffee Orders")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
