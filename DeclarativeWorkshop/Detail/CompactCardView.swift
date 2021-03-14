//
//  CompactCardView.swift
//  DeclarativeWorkshop
//
//  Created by Vadim Belyaev on 3/14/21.
//

import SwiftUI

struct CompactCardView: View {
    let cardholderName: String
    let cardNumber: String
    
    var body: some View {
        HStack {
            Image("mastercard")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: 48, maxHeight: 48, alignment: .trailing)
            VStack(alignment: .leading, spacing: 4.0) {
                Text(cardholderName)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                Text(cardNumber)
                    .font(.footnote)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
            Image(systemName: "arrow.right")
                .foregroundColor(.white)
                .background(Color.purple)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.blue)
        .cornerRadius(10.0)
        .padding(.horizontal)

    }
}

struct CompactCardView_Previews: PreviewProvider {
    static var previews: some View {
        CompactCardView(cardholderName: "Maria Smith", cardNumber: "•••• •••• •••• 1233")
    }
}
