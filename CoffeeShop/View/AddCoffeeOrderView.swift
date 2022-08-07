//
//  AddCoffeeOrderView.swift
//  CoffeeShop
//
//  Created by Sally Xie on 2022/7/30.
//

import SwiftUI

struct AddCoffeeOrderView: View {
    @Binding var isPresented: Bool
    @ObservedObject private var addCoffeeOrderVM = AddCoffeeOrderViewModel()
    
    //@State var selection: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    
                    Section(header: Text("INFORMATION").font(.body)) {
                        TextField("Enter Name", text: $addCoffeeOrderVM.name)
                    }
                    
                    Section(header: Text("Select Coffee")) {
                        ForEach(addCoffeeOrderVM.coffeeList, id: \.name) { coffee in
                            CoffeeCellView(coffee: coffee, selection: $addCoffeeOrderVM.coffeeName)
                            
                        }
                    }
                    
                    Section {
                        Picker("選擇類型", selection: $addCoffeeOrderVM.size) {
                            Text("Small").tag("Small")
                            Text("Medium").tag("Medium")
                            Text("Large").tag("Large")
                        }.pickerStyle(.segmented)
                    } header: {
                        Text("Select Size").font(.body)
                    } footer: {
                        OrderTotalView(total: addCoffeeOrderVM.total)
                    }
                    
                    HStack {
                        Spacer()
                        Button("Place Order") {
                            self.addCoffeeOrderVM.placeOrder()
                            self.isPresented = false
                        }
                        Spacer()
                        
                    }.padding(EdgeInsets(top: 12, leading: 100, bottom: 12, trailing: 100))
                        .foregroundColor(Color.white)
                    .background(Color(red: 46/255, green: 204/255, blue: 113/255))
                    .cornerRadius(10)

                }
            }
            .navigationTitle("Add Coffee")
        }
    }
}

struct AddCoffeeOrderView_Previews: PreviewProvider {
    static var previews: some View {
        AddCoffeeOrderView(isPresented: .constant(false))
    }
}

struct CoffeeCellView: View {

    let coffee: CoffeeViewModel
    
    @Binding var selection: String
    
    var body: some View {
        HStack {
            Image(coffee.imageURL)
                .resizable()
                .frame(width: 100, height: 100)
                .cornerRadius(10)
            Text(coffee.name)
                .font(.title)
                .padding(.all, 10)
            Spacer()
            Image(systemName: self.selection == coffee.name ? "checkmark" : "")
                .padding()
        }.onTapGesture {
            self.selection = coffee.name
        }
    }
}
