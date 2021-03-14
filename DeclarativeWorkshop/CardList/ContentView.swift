//
//  ContentView.swift
//  DeclarativeWorkshop
//
//  Created by andrey on 11.03.2021.
//

import SwiftUI

struct ContentView: View {
    private let cards = BankCard.cards
    
    var body: some View {
        NavigationView {
            VStack {
                TopPanelView()
                
                ScrollView {
                    ForEach(cards) { (bankCard) in
                        NavigationLink(
                            destination: DetailView(bankCard: bankCard),
                            label: {
                                BankCardCellView(card: bankCard)
                            })
                    }
                }
                .navigationBarTitle("")
                .navigationBarHidden(true)                
            }
            .background(LinearGradient(gradient: Gradient(colors: [Color.gray.opacity(0.2), Color.gray.opacity(0.5)]), startPoint: .top, endPoint: .bottom))
            .ignoresSafeArea(.container, edges: .bottom)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 12"))
                        .previewDisplayName("iPhone 12")
    }
}
