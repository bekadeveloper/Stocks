//
//  RowView.swift
//  Stocks
//
//  Created by Begzod Bakhriddinov on 16/02/21.
//

import SwiftUI

struct RowView: View {
    var stock: Stock
    
    var body: some View {
        HStack {
            Image(stock.symbol.lowercased())
                .cornerRadius(12)
                .padding(8)
            
            VStack(alignment: .leading, spacing: 1) {
                HStack {
                    Text(stock.symbol)
                        .font(.headline)
                        .fontWeight(.bold)
                }
                
                Text(stock.name)
                    .font(.footnote)
                    .fontWeight(.semibold)
            }
            
            Spacer()
            
            VStack(alignment: .trailing) {
                Text("$\(stock.close)")
                    .font(.headline)
                    .fontWeight(.bold)
                Text("+$\(stock.change) (\(stock.percent_change)%)")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundColor(.green)
            }
            .padding(9)
        }
        .background(Color(red: 0.938, green: 0.958, blue: 0.97))
        .foregroundColor(.black)
        .cornerRadius(16)
    }
}



let sampleStock = Stock(symbol: "MA", name: "Mastercard", close: "134.52", change: "456.7", percent_change: "12.3")

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(stock: sampleStock)
            .preferredColorScheme(.light)
    }
}
