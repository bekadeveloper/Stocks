//
//  ModelData.swift
//  Stocks
//
//  Created by Begzod Bakhriddinov on 17/02/21.
//

import Foundation
import Combine


// MARK: NOT USING THIS SOURCE CODE


//class Api {
//    func getStocks(completion: @escaping ([Stock]) -> ()) {
//        guard let url = URL(string: "") else {
//            return
//        }
//
//        URLSession.shared.dataTask(with: url) { (data, _, _) in
//            let decoder = JSONDecoder()
//
//            let stocks = try! decoder.decode([Stock].self, from: data!)
//            print(stocks)
//
//            DispatchQueue.main.async {
//                completion(stocks)
//            }
//        }
//        .resume()
//    }
//}


// MARK: Function to decode data from JSON file

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
