//
//  ListView.swift
//  Stocks
//
//  Created by Begzod Bakhriddinov on 16/02/21.
//

import SwiftUI

struct ListView: View {
    @Binding var stocks: [Stock]
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(stocks) { stock in
                    RowView(stock: stock)
                        .padding(.top, 1)
                        .padding(.bottom, 1)
                        .padding(.trailing, 10)
                        .padding(.leading, 10)
                }
            }
            .navigationTitle("Stocks")
        }
    }
}
