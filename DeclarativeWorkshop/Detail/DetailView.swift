//
//  DetailView.swift
//  DeclarativeWorkshop
//
//  Created by Vadim Belyaev on 3/14/21.
//

import SwiftUI

struct DetailView: View {
    
    let bankCard: BankCard
    
    var body: some View {
        VStack {
            CompactCardView(bankCard: bankCard)
                .padding(.top)
            totalsSection
            Divider()
            monthsSection
            yearIndicator
            List {
                ForEach(bankCard.transactions) { transaction in
                    TransactionCellView(
                        title: transaction.title,
                        emoji: transaction.category.emoji,
                        date: transaction.date,
                        amount: transaction.amount
                    )
                        .padding(.vertical)
                }
            }
            .cornerRadius(10)
            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0.0, y: 0.0)
            .padding(.horizontal)
            .ignoresSafeArea(.container, edges: .bottom)
        }
        .navigationTitle("Dashboard")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    var totalsSection: some View {
        return HStack {
            Spacer()
            TotalsView(title: "Income", amount: bankCard.totalIncome, indicatorColor: .systemGreen)
            Spacer()
            Text("⋮")
                .font(.largeTitle)
                .foregroundColor(.init(UIColor.lightGray))
            Spacer()
            TotalsView(title: "Spent", amount: -bankCard.totalSpending, indicatorColor: .systemRed)
            Spacer()
        }
        .padding(.vertical)
    }
    
    var monthsSection: some View {
        return HStack {
            Spacer()
            Text("August".uppercased())
                .font(.footnote)
                .foregroundColor(.init(UIColor.secondaryLabel))
            Spacer()
            Text("September".uppercased())
                .font(.body)
                .fontWeight(.bold)
            Spacer()
            Text("October".uppercased())
                .font(.footnote)
                .foregroundColor(.init(UIColor.secondaryLabel))
            Spacer()
        }
        .padding(EdgeInsets(top: 24, leading: 0, bottom: 0, trailing: 0))
    }
    
    var yearIndicator: some View {
        Text("2017")
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundColor(.white)
            .padding(EdgeInsets(top: 3, leading: 6, bottom: 3, trailing: 6))
            .background(Color.gray)
            .cornerRadius(5.0)
            .offset(x: 0, y: 20.0)
            .zIndex(999.0)
    }    
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(bankCard: BankCard(
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
            ))
        }
    }
}
