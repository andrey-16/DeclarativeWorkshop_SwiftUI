//
//  BankCardCellView.swift
//  DeclarativeWorkshop
//
//  Created by andrey on 14.03.2021.
//

import SwiftUI

struct BankCardView: View {
    let card: BankCard
    
    var body: some View {
        VStack {
            HStack {
                card.type.logoView
                    .padding()
                Spacer()
            }
            
            Text(maskedCardNumber)
                .foregroundColor(.white)
                .font(.title)
                .padding(.bottom)
        }
        .padding(.bottom)
        .background(LinearGradient(gradient: Gradient(colors: [card.type.color, card.type.color.opacity(0.6)]), startPoint: .center, endPoint: .trailing))
        .cornerRadius(10)
    }
    
    var maskedCardNumber: String {
        "****     ****     ****     " + card.cardNumber.suffix(4)
    }
}

struct BankCardCellView_Previews: PreviewProvider {
    static var previews: some View {
        BankCardView(card: BankCard.cards.first!)
            .previewDevice(PreviewDevice(rawValue: "iPhone 12"))
                        .previewDisplayName("iPhone 12")
    }
}
