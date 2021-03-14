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
            return "American Express"
        case .visa:
            return "Visa"
        case .discover:
            return "Discover"
        case .masterCard:
            return "Master Card"
        }
    }
}

enum TransactionCategory {
    case car
    case clothes
    case finance
    case food
    case income
    case shopping
    
    var emoji: String {
        switch self {
        case .car:
            return "🚘"
        case .clothes:
            return "👕"
        case .finance:
            return "💳"
        case .food:
            return "🥙"
        case .income:
            return "🪙"
        case .shopping:
            return "🛍"
        }
    }
}

struct BankCard: Identifiable {
    let id = UUID()
    let cardholderName: String
    let type: BankCardType
    let cardNumber: String
    let transactions: [BankTransaction]
    
    var totalIncome: Int {
        transactions
            .map { $0.amount }
            .filter { $0 > 0 }
            .reduce(0, +)
    }
    
    var totalSpending: Int {
        transactions
            .map { $0.amount }
            .filter { $0 < 0 }
            .reduce(0, +)
    }
}

struct BankTransaction: Identifiable {
    let id = UUID()
    let title: String
    let amount: Int
    let category: TransactionCategory
    let date: Date
}

extension BankCard {
    static let cards: [BankCard] = [
        BankCard(
            cardholderName: "Maria Smith",
            type: .amex,
            cardNumber: "1234567812345671",
            transactions: [
                BankTransaction(title: "Visa", amount: 120200, category: .income, date: Date(y: 2020, m: 9, d: 4)),
                BankTransaction(title: "Shopping", amount: -1200, category: .shopping, date: Date(y: 2020, m: 9, d: 6)),
                BankTransaction(title: "Car", amount: -36050, category: .car, date: Date(y: 2020, m: 9, d: 10)),
                BankTransaction(title: "Visa", amount: 2200, category: .income, date: Date(y: 2020, m: 9, d: 15)),
                BankTransaction(title: "Clothes", amount: -25012, category: .clothes, date: Date(y: 2020, m: 9, d: 16)),
                BankTransaction(title: "Insurance", amount: -39050, category: .finance, date: Date(y: 2020, m: 9, d: 21)),
                BankTransaction(title: "Groceries", amount: -40021, category: .food, date: Date(y: 2020, m: 9, d: 23)),
                BankTransaction(title: "Salary Deposit", amount: 400000, category: .income, date: Date(y: 2020, m: 9, d: 29)),
            ]
        ),
        BankCard(cardholderName: "Maria Smith", type: .visa, cardNumber: "1234567812345672", transactions: []),
        BankCard(cardholderName: "Maria Smith", type: .masterCard, cardNumber: "1234567812345673", transactions: []),
        //BankCard(cardholderName: "Maria Smith", type: .amex, cardNumber: "1234567812345674")
    ]
}

extension Date {
    init(y: Int, m: Int, d: Int) {
        let calendar = Calendar.current
        let components = DateComponents(calendar: calendar, timeZone: calendar.timeZone, year: y, month: m, day: d)
        self = calendar.date(from: components)!
    }
}
