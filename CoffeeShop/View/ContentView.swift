//
//  ContentView.swift
//  CoffeeShop
//
//  Created by Sally Xie on 2022/7/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showModal: Bool = false
    
    @StateObject private var vm = OrderListViewModel()
    
    init() {

        UINavigationBar.appearance().backgroundColor = UIColor(displayP3Red: 165/255, green: 94/255, blue: 234/255, alpha: 1.0)
               
        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
               
    }
    
    var body: some View {
        NavigationView {
            CoffeeListView(orders: vm.orders)
                .sheet(isPresented: self.$showModal) {
                    AddCoffeeOrderView(isPresented: self.$showModal)
                }
                .navigationBarItems(leading: Button(action: reloadOrders) {
                    Image(systemName: "arrow.clockwise")
                        .foregroundColor(Color.white)
                    }, trailing: Button(action: showAddCoffeeOrderView){
                        Image(systemName: "plus")
                            .foregroundColor(Color.white)
                })
                .navigationTitle("Coffee Orders")
            
            
                
        }
    }
    
    private func reloadOrders() {
        self.vm.fetch()
    }
    
    private func showAddCoffeeOrderView() {
        self.showModal = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
