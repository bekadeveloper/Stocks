//
//  AppModel.swift
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
    
    private var iconName: String
    
    var icon: Image {
        Image(iconName)
    }
}
