//
//  ListView.swift
//  Stocks
//
//  Created by Begzod Bakhriddinov on 16/02/21.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(modelData.stocks) { stock in
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

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
            .colorScheme(.dark)
            .environmentObject(ModelData())
    }
}