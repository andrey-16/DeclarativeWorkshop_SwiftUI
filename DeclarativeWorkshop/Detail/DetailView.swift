//
//  DetailView.swift
//  DeclarativeWorkshop
//
//  Created by Vadim Belyaev on 3/14/21.
//

import SwiftUI

struct DetailView: View {
    var body: some View {
        VStack {
            CompactCardView(cardholderName: "Maria Smith", cardNumber: "•••• •••• •••• 1233")
            HStack {
                VStack {
                    Text("Income")
                    Text("$3,200")
                }
                Text("⋮")
                VStack {
                    Text("Spent")
                    Text("$1,400")
                }
            }
            HStack {
                Text("August")
                Text("September")
                Text("October")
            }
            List {
                HStack {
                    Text("Visa")
                    Spacer()
                    Text("$1202.00")
                }
                HStack {
                    Text("Shopping")
                    Spacer()
                    Text("$12.00")
                }

            }
        }
        .navigationTitle("Dashboard")
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView()
        }
    }
}
