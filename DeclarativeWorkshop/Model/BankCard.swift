//
//  BankCard.swift
//  DeclarativeWorkshop
//
//  Created by andrey on 14.03.2021.
//

import SwiftUI

enum BankCardType {
    case amex
    case visa
    case discover
    case masterCard
    
    var title: String {
        switch self {
        case .amex:
            return "Americal Express"
        case .visa:
            return "Visa"
        case .discover:
            return "Discover"
        case .masterCard:
            return "Master Card"
        }
    }
}

struct BankCard: Identifiable {
    var id = UUID()
    let cardholderName: String
    let type: BankCardType
    let cardNumber: String
    let transactions: [BankTransaction] = []
}

struct BankTransaction {
    let id: String = ""
    let title: String
    let value: Float
}

extension BankCard {
    static let cards: [BankCard] = [
        BankCard(cardholderName: "Maria Smith", type: .visa, cardNumber: "1234567812345671"),
        BankCard(cardholderName: "Maria Smith", type: .visa, cardNumber: "1234567812345672"),
        BankCard(cardholderName: "Maria Smith", type: .masterCard, cardNumber: "1234567812345673"),
        BankCard(cardholderName: "Maria Smith", type: .amex, cardNumber: "1234567812345674")
    ]
}
