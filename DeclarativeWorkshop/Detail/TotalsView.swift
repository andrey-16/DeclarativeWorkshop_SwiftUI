//
//  TotalsView.swift
//  DeclarativeWorkshop
//
//  Created by Vadim Belyaev on 3/14/21.
//

import SwiftUI

struct TotalsView: View {
    let title: String
    let amount: Int
    let indicatorColor: UIColor
    
    var body: some View {
        VStack {
            Text(title.uppercased())
                .font(.caption)
                .fontWeight(.bold)
                .foregroundColor(.init(.secondary))
            Text(formattedAmount)
                .fontWeight(.bold)
                .padding(EdgeInsets(top: 4, leading: 0, bottom: 8, trailing: 0))
            Color(indicatorColor)
                .frame(width: 24, height: 3, alignment: .center)
        }
    }
    
    private var formattedAmount: String {
        Formatters.currencyFormatter.string(from: NSNumber(value: amount / 100)) ?? ""
    }
}

struct TotalsView_Previews: PreviewProvider {
    static var previews: some View {
        TotalsView(title: "Income", amount: 320000, indicatorColor: .green)
    }
}

