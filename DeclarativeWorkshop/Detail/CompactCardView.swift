//
//  CompactCardView.swift
//  DeclarativeWorkshop
//
//  Created by Vadim Belyaev on 3/14/21.
//

import SwiftUI

struct CompactCardView: View {
    let bankCard: BankCard
    
    var body: some View {
        HStack {
            bankCard.type.logoView
                .padding(.horizontal)
            VStack(alignment: .leading, spacing: 4.0) {
                Text(bankCard.cardholderName)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                Text(maskedCardNumber)
                    .font(.footnote)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
            Spacer()
            Image(systemName: "arrow.right")
                .frame(maxHeight: .infinity)
                .foregroundColor(.white)
                .padding(.horizontal)
                .background(bankCard.type.color)
        }
        .frame(maxWidth: .infinity, maxHeight: 80)
        .background(LinearGradient(gradient: Gradient(colors: [bankCard.type.color.opacity(0.5), bankCard.type.color.opacity(0.9)]), startPoint: .leading, endPoint: .trailing))
        .cornerRadius(10.0)
        .padding(.horizontal)
    }
    
    var maskedCardNumber: String {
        "•••• •••• •••• " + bankCard.cardNumber.suffix(4)
    }
}

struct CompactCardView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            CompactCardView(bankCard: BankCard(cardholderName: "Maria Smith", type: .amex, cardNumber: "1234 5678 0011 3322", transactions: []))
            CompactCardView(bankCard: BankCard(cardholderName: "Konstantin Konstantinopolskiy", type: .visa, cardNumber: "1234 5678 0011 1919", transactions: []))
            CompactCardView(bankCard: BankCard(cardholderName: "ぁつざほぽろゕヺポ", type: .masterCard, cardNumber: "1234 5678 0011 2211", transactions: []))
        }
    }
}
