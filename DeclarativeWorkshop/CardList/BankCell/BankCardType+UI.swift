//
//  BankCardType+UI.swift
//  DeclarativeWorkshop
//
//  Created by Vadim Belyaev on 3/15/21.
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
