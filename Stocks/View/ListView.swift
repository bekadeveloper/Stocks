//
//  ListView.swift
//  Stocks
//
//  Created by Begzod Bakhriddinov on 16/02/21.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var stockData: StockData
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    ForEach(stockData.stocks) { stock in
                        RowView(stock: stock)
                    }
                }
            }
            .navigationTitle("Stocks")
        }
        .onAppear {
            stockData.getStocks()
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
            .preferredColorScheme(.light)
            .environmentObject(StockData())
    }
}
