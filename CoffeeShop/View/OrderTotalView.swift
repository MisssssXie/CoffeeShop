//
//  OrderTotalView.swift
//  CoffeeShop
//
//  Created by Sally Xie on 2022/7/30.
//

import SwiftUI

struct OrderTotalView: View {
    
    let total: Double
    
    var body: some View {
        
        HStack(alignment: .center) {
            Spacer()
            Text(String(format: "$%2.f", total))
                .font(.title)
                .foregroundColor(.blue)
            Spacer()
        }.padding(10)
    }
}

struct OrderTotalView_Previews: PreviewProvider {
    static var previews: some View {
        OrderTotalView(total: 99.9)
    }
}
