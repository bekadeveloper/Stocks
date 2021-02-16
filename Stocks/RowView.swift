//
//  RowView.swift
//  Stocks
//
//  Created by Begzod Bakhriddinov on 16/02/21.
//

import SwiftUI

struct RowView: View {
    var body: some View {
        HStack {
            
            Image("YNDX")
                .cornerRadius(12)
                .padding(8)
            
            VStack(alignment: .leading) {
                HStack {
                    Text("YNDX")
                        .font(.headline)
                        .fontWeight(.bold)
                    Label("", systemImage: "star.fill")
                        .foregroundColor(.yellow)
                        .frame(width: 16, height: 16)
                        .padding(.leading, 6)
                }
                
                Text("Yandex, LLC")
                    .font(.footnote)
                    .fontWeight(.semibold)
            }
            
            Spacer()
            
            VStack(alignment: .trailing) {
                Text("$72.15")
                    .font(.headline)
                    .fontWeight(.bold)
                Text("+$0.12 (1,15%)")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundColor(.green)
            }
            .padding(8)
        }
        .background(Color(red: 0.938, green: 0.958, blue: 0.97))
        .foregroundColor(.black)
        .cornerRadius(16)
        .padding()
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView()
            .preferredColorScheme(.dark)
    }
}
