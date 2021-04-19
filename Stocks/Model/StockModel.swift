//
//  StockModel.swift
//  Stocks
//
//  Created by Begzod Bakhriddinov on 16/02/21.
//

import Foundation
import SwiftUI


struct Stock: Identifiable, Decodable {
    
    var id: String
    var companyName: String
    var ticker: String
    var isFavourite: Bool
    var currentPrice: Double
    var dayDeltaCash: Double
    var dayDeltaPercent: Double
    var iconName: String
    
    
    var strPrice: String {
        String(format: "%.2f", currentPrice)
    }
    var strCash: String {
        String(format: "%.2f", dayDeltaCash)
    }
    var strPercent: String {
        String(format: "%.2f", dayDeltaPercent)
    }
}


class StockData: ObservableObject {
    @Published var stocks: [Stock] = []
    
    
    func getStocks() {
        guard let url = URL(string: "https://gist.githubusercontent.com/bekadeveloperx/55878e39df3d42aec1f5edbc1f82f3c6/raw/f81e9d4388f5aeae4080f39e5fa8521502052a1f/stocks.json") else { fatalError("Missing URL") }

        let urlRequest = URLRequest(url: url)

        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }

            guard let response = response as? HTTPURLResponse else { return }

            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        let decodedStocks = try JSONDecoder().decode([Stock].self, from: data)
                        self.stocks = decodedStocks
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            }
        }

        dataTask.resume()
    }
}
