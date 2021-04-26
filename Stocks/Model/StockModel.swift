//
//  StockModel.swift
//  Stocks
//
//  Created by Begzod Bakhriddinov on 16/02/21.
//

import Foundation
import SwiftUI


struct Stock: Identifiable, Decodable {
    var id: UUID {
        UUID()
    }
    var symbol: String
    var name: String
    var close: String
    var change: String
    var percent_change: String
    var exchange: String
    var currency: String
}

struct Stocks: Decodable {
    var aapl: Stock
    var amzn: Stock
    var msft: Stock
    var eth: Stock
    var tsla: Stock
    var googl: Stock
    var btc: Stock
    var doge: Stock
    
    var stockArray: [Stock] {
        Array(arrayLiteral: aapl, amzn, msft, tsla, googl, eth, btc, doge)
    }
    
    enum CodingKeys: String, CodingKey {
        case aapl = "aapl"
        case amzn = "amzn"
        case msft = "msft"
        case eth = "eth/usd"
        case tsla = "tsla"
        case googl = "googl"
        case btc = "btc/usd"
        case doge = "doge/usd"
    }
}


class StockData: ObservableObject {
    @Published var stocks: [Stock] = []
    
    private let apiKey = API_KEY // ! IN ORDER TO RUN THE APP YOU SHOULD PLACE YOUR OWN API KEY HERE
    private let symbols = "aapl,amzn,msft,eth/usd,tsla,googl,btc/usd,doge/usd"
    
    func getStocks() {
        guard let url = URL(string: "https://api.twelvedata.com/quote?symbol=\(symbols)&apikey=\(apiKey)") else { fatalError("Missing URL") }

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
                        let decodedStocks = try JSONDecoder().decode(Stocks.self, from: data)
                        self.stocks = decodedStocks.stockArray
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            }
        }
        dataTask.resume()
    }
}
