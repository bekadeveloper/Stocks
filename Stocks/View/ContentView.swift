//
//  ContentView.swift
//  Stocks
//
//  Created by Begzod Bakhriddinov on 16/02/21.
//

import SwiftUI

struct ContentView: View {
    @State private var stocks: [Stock] = []
    
    var body: some View {
        ListView(stocks: $stocks)
            .onAppear {
                Api().getStocks { (stocks) in
                    self.stocks = stocks
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
