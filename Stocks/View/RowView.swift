//
//  RowView.swift
//  Stocks
//
//  Created by Begzod Bakhriddinov on 16/02/21.
//

import SwiftUI

struct RowView: View {
    var stock: Stock

    var body: some View {
        HStack {
            if stock.symbol == "BTC/USD" {
                CustomImageView(imageName: "BTC")
                
            } else if stock.symbol == "ETH/USD" {
                CustomImageView(imageName: "ETH")
                
            } else if stock.symbol == "DOGE/USD" {
                CustomImageView(imageName: "DOGE")
                
            } else {
                CustomImageView(imageName: stock.symbol)
            }
            
            VStack(alignment: .leading, spacing: 1) {
                HStack {
                    Text(stock.symbol)
                        .font(.headline)
                        .fontWeight(.bold)
                }
                
                Text(stock.name)
                    .font(.footnote)
                    .fontWeight(.semibold)
            }
            
            Spacer()
            
            CustomTextView(stock: stock)
        }
        .background(Color(red: 0.938, green: 0.958, blue: 0.97))
        .foregroundColor(.black)
        .cornerRadius(15)
        .padding(.vertical, 1)
        .padding(.horizontal, 9)
    }
}


struct CustomImageView: View {
    var imageName: String
    
    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFit()
            .frame(width: 50, height: 50)
            .cornerRadius(12)
            .padding(.vertical, 5)
            .padding(.leading, 5)
    }
}


struct CustomTextView: View {
    var stock: Stock
    
    var close: String {
        String(format: "%.2f", Float(stock.close)!)
    }
    var change: String {
        String(format: "%.1f", Float(stock.change)!.magnitude)
    }
    var percent_change: String {
        String(format: "%.1f", Float(stock.percent_change)!.magnitude)
    }
    
    var body: some View {
        VStack(alignment: .trailing) {
            Text("$\(close)")
                .font(.headline)
                .bold()
            
            Text("\(Float(stock.change)!>=0 ?"":"-")$\(change) (\(percent_change)%)")
                .foregroundColor(Float(stock.change)!>=0 ?.green:.red)
                .font(.footnote)
                .fontWeight(.semibold)
        }
        .padding(10)
    }
}





struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(stock: sampleStock)
            .preferredColorScheme(.dark)
    }
}

let sampleStock = Stock(symbol: "BTC/USD", name: "Bitcoin", close: "134.52000", change: "+4.7000", percent_change: "12.3000", exchange: "", currency: "")
