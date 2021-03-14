//
//  BankCardCellView.swift
//  DeclarativeWorkshop
//
//  Created by andrey on 14.03.2021.
//

import SwiftUI

struct BankCardCellView: View {
    let card: BankCard
    
    var body: some View {
        VStack {
            ZStack {                
                HStack {
                    VStack {
                        HStack {
                            card.type.logoView
                                .padding()
                            Spacer()
                        }
                        
                        Text("****     ****     ****     " + card.cardNumber.suffix(4))
                            .foregroundColor(.white)
                            .font(Font.system(size: 24, weight: .medium, design: .default))
                            .padding(.bottom)
                    }
                    Spacer()
                }
                .padding(.bottom)
                .background(LinearGradient(gradient: Gradient(colors: [card.type.color, card.type.color.opacity(0.6)]), startPoint: .center, endPoint: .trailing))
                .cornerRadius(10)
            }
        }
        .padding(.top)
        .padding(.horizontal)
    }
}

struct BankCardCellView_Previews: PreviewProvider {
    static var previews: some View {
        BankCardCellView(card: BankCard.cards.first!)
            .previewDevice(PreviewDevice(rawValue: "iPhone 12"))
                        .previewDisplayName("iPhone 12")
    }
}
