//
//  ContentView.swift
//  Stocks
//
//  Created by Begzod Bakhriddinov on 16/02/21.
//

import SwiftUI

struct ContentView: View {
    var stockData = StockData()
    
    var body: some View {
        ListView()
            .environmentObject(stockData)
            .onAppear {
                stockData.getStocks()
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
