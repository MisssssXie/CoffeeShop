////
////  AddCoffeeOrderView.swift
////  CoffeeShop
////
////  Created by Sally Xie on 2022/7/30.
////
//
//import SwiftUI
//
//struct AddCoffeeOrderView: View {
//
//    @ObservedObject private var addCoffeeOrderVM = AddCoffeeOrderViewModel()
//
//    @State var selection: String = ""
//    
//    var body: some View {
//        NavigationView {
//            VStack {
//                Form {
//
//                    Section(header: Text("INFORMATION").font(.body)) {
//                        TextField("Enter Name", text: $addCoffeeOrderVM.name)
//                    }
//
//                    Section(header: Text("Select Coffee")) {
//                        ForEach(addCoffeeOrderVM.coffeeList, id: \.name) { coffee in
//                            HStack {
//                                Image(coffee.imageURL)
//                                    .resizable()
//                                    .frame(width: 100, height: 100)
//                                    .cornerRadius(10)
//                                Text(coffee.name)
//                                    .font(.title)
//                                    .padding(.all, 10)
//                                Spacer()
//                                Image(systemName: self.selection == coffee.name ? "checkmark" : "")
//                                    .padding()
//                            }.onTapGesture {
//                                selection = coffee.name
//                            }
//
//                        }
//                    }
//                }
//            }
//            .navigationTitle("Add Coffee")
//        }
//    }
//}
//
//struct AddCoffeeOrderView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddCoffeeOrderView()
//    }
//}
////
////struct CoffeeCellView: View {
////
////    var body: some View {
////        HStack {
////            Image(coffee.imageURL)
////                .resizable()
////                .frame(width: 100, height: 100)
////                .cornerRadius(10)
////            Text(coffee.name)
////                .font(.title)
////                .padding(.all, 10)
////            Spacer()
////            Image(systemName: self.selection == coffee.name ? "checkmark" : "")
////                .padding()
////        }.onTapGesture {
////            self.selection = coffee.name
////        }
////    }
////}
