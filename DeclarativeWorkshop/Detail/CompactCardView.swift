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
                .scaledToFill()
                .frame(width: 80, height: 48, alignment: .leading)
                .padding(.horizontal)
            VStack(alignment: .leading, spacing: 4.0) {
                Text(cardholderName)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                Text(cardNumber)
                    .font(.footnote)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
            Spacer()
            Image(systemName: "arrow.right")
                .frame(maxHeight: .infinity)
                .foregroundColor(.white)
                .padding(.horizontal)
                .background(Color.purple)
        }
        .frame(maxWidth: .infinity, maxHeight: 80)
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
