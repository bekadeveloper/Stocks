//
//  StockModel.swift
//  Stocks
//
//  Created by Begzod Bakhriddinov on 16/02/21.
//

import Foundation
import SwiftUI

struct Stock: Identifiable, Decodable {
    var id: Int
    var companyName: String
    var ticker: String
    var isFavourite: Bool
    var currentPrice: Float
    var dayDeltaCash: Double
    var dayDeltaPercent: Float
    var iconName: String
}

class Api {
    func getStocks(completion: @escaping ([Stock]) -> ()) {
        guard let url = URL(string: "https://gist.githubusercontent.com/bekadeveloperx/55878e39df3d42aec1f5edbc1f82f3c6/raw/253622d672e984f33ec47994824af9906fa53a21/stocks.json") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let decoder = JSONDecoder()
                        
            let stocks = try! decoder.decode([Stock].self, from: data!)
            
            DispatchQueue.main.async {
                completion(stocks)
            }
        }
        .resume()
    }
}
