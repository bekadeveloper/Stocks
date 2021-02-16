//
//  AppModel.swift
//  Stocks
//
//  Created by Begzod Bakhriddinov on 16/02/21.
//

import Foundation
import SwiftUI

struct Stock: Identifiable {
    var id: UUID
    var companyName: String
    var ticker: String
    var isFavourite: Bool
    var currentPrice: Float
    var dayDelta: Float
    
    private var logoName: String
    
    var logo: Image {
        Image(logoName)
    }
}
