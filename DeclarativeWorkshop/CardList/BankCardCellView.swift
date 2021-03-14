//
//  BankCardCellView.swift
//  DeclarativeWorkshop
//
//  Created by andrey on 14.03.2021.
//

import SwiftUI

extension BankCardType {
    var logoView: AnyView {
        switch self {
        case .amex:
            return AnyView(Image(imageName)
                .resizable()
                .renderingMode(.template)
                .foregroundColor(.white)
                .scaledToFill()
                .frame(width: 72, height: 22, alignment: .leading)
            )
        case .visa:
            return AnyView(Image(imageName)
                .resizable()
                .foregroundColor(.white)
                .scaledToFit()
                .frame(width: 72, height: 22, alignment: .leading)
            )
        case .discover:
            return AnyView(Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: .infinity, height: 22, alignment: .leading)
            )
        case .masterCard:
            return AnyView(Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 22, alignment: .leading)
            )
        }
    }
    
    var color: Color {
        switch self {
        case .amex:
            return Color(#colorLiteral(red: 0.03683477268, green: 0.6447305083, blue: 0.8840168715, alpha: 1))
        case .visa:
            return Color(#colorLiteral(red: 0.3098039216, green: 0.3019607843, blue: 0.8352941176, alpha: 1))
        case .discover:
            return Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
        case .masterCard:
            return Color(#colorLiteral(red: 0.07245818526, green: 0.2664819658, blue: 0.4738516808, alpha: 1))
        }
    }
    
    var imageName: String {
        switch self {
        case .amex:
            return "amex2"
        case .visa:
            return "Visa_Inc._logo"
        case .discover:
            return "Visa_Inc._logo"
        case .masterCard:
            return "mastercard"
        }
    }
}

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
