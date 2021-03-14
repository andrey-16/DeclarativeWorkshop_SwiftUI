//
//  TransactionCellView.swift
//  DeclarativeWorkshop
//
//  Created by Vadim Belyaev on 3/14/21.
//

import SwiftUI

struct TransactionCellView: View {
    let title: String
    let emoji: String
    let date: Date
    let amount: Int
    
    var body: some View {
        HStack {
            Text(emoji)
                .font(.largeTitle)
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .fontWeight(.bold)
                Text(formattedDate.uppercased())
                    .font(.footnote)
                    .foregroundColor(.init(UIColor.secondaryLabel))
            }
            Spacer()
            Text(formattedAmount)
                .fontWeight(.bold)
            indicator
        }
    }
    
    var indicator: some View {
        if amount >= 0 {
            return Image(systemName: "arrow.up")
                .foregroundColor(.init(UIColor.systemGreen))
        } else {
            return Image(systemName: "arrow.down")
                .foregroundColor(.init(UIColor.systemRed))
        }
    }
    
    var formattedDate: String {
        dateFormatter.string(from: date)
    }
    
    var formattedAmount: String {
        Formatters.currencyFormatter.string(from: NSNumber(value: amount / 100)) ?? ""
    }
}

private let dateFormatter: DateFormatter = {
    let df = DateFormatter()
    df.dateFormat = "d MMMM"
    return df
}()

struct TransactionCellView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionCellView(title: "Shopping", emoji: "🛍", date: Date(), amount: 120200)
    }
}
