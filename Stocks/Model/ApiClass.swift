//
//  ModelData.swift
//  Stocks
//
//  Created by Begzod Bakhriddinov on 17/02/21.
//

import Foundation
import Combine



class Api {
    func getStocks(completion: @escaping ([Stock]) -> ()) {
        guard let url = URL(string: "https://gist.githubusercontent.com/bekadeveloperx/55878e39df3d42aec1f5edbc1f82f3c6/raw/677385864d61df5791a06eb3f7c7146225cfe403/stocks.json") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let decoder = JSONDecoder()
                        
            let stocks = try! decoder.decode([Stock].self, from: data!)
            print(stocks)
            
            DispatchQueue.main.async {
                completion(stocks)
            }
        }
        .resume()
    }
}



func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
