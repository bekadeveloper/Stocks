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
            Image(stock.iconName)
                .cornerRadius(12)
                .padding(8)
            
            VStack(alignment: .leading, spacing: 1) {
                HStack {
                    Text(stock.ticker)
                        .font(.headline)
                        .fontWeight(.bold)
                    if stock.isFavourite {
                        Image(systemName: "star.fill")
                            .foregroundColor(stock.isFavourite ? .yellow : .gray)
                            .frame(width: 16, height: 16)
                            .padding(5)
                    }
                }
                
                Text(stock.companyName)
                    .font(.footnote)
                    .fontWeight(.semibold)
            }
            
            Spacer()
            
            VStack(alignment: .trailing) {
                Text("$\(stock.strPrice)")
                    .font(.headline)
                    .fontWeight(.bold)
                Text("+$\(stock.strCash) (\(stock.strPercent)%)")
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



let sampleStock = Stock(id: UUID().uuidString, companyName: "Mastercard", ticker: "MA", isFavourite: true, currentPrice: 134.52, dayDeltaCash: 456.7, dayDeltaPercent: 12.3, iconName: "mastercard")

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(stock: sampleStock)
            .preferredColorScheme(.light)
    }
}
