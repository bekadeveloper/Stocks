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
            
            VStack(alignment: .leading) {
                HStack {
                    Text(stock.ticker)
                        .font(.headline)
                        .fontWeight(.bold)
                    Label("", systemImage: "star.fill")
                        .foregroundColor(stock.isFavourite ? .yellow : .gray)
                        .frame(width: 16, height: 16)
                        .padding(.leading, 6)
                }
                
                Text(stock.companyName)
                    .font(.footnote)
                    .fontWeight(.semibold)
            }
            
            Spacer()
            
            VStack(alignment: .trailing) {
                Text("$\(stock.dayDeltaCash)")
                    .font(.headline)
                    .fontWeight(.bold)
                Text("+$0.12 (1,15%)")
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

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(stock: ModelData().stocks[0])
            .preferredColorScheme(.dark)
    }
}
