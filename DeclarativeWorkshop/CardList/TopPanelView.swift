//
//  TopPanelView.swift
//  DeclarativeWorkshop
//
//  Created by andrey on 14.03.2021.
//

import SwiftUI

struct TopPanelView: View {
    var body: some View {
        HStack {
            Image(systemName: "wallet.pass")
                .foregroundColor(.init(UIColor.secondaryLabel))
                .accentColor(.init(UIColor.systemBlue))
            Text("My Wallet")
                .font(.footnote)
                .fontWeight(.bold)
            Spacer()
            Text("User name")
                .font(.footnote)
                .fontWeight(.medium)
                .foregroundColor(.init(UIColor.secondaryLabel))
            
        }
        .padding()
        .background(Color(UIColor.systemBackground))
    }
}

struct TopPanelView_Previews: PreviewProvider {
    static var previews: some View {
        TopPanelView()
    }
}
