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
                .foregroundColor(.gray)
                .accentColor(.blue)
            Text("My Wallet")
                .font(Font.system(size: 14, weight: .bold, design: .default))
            Spacer()
            Text("User name")
                .font(Font.system(size: 14, weight: .medium, design: .default))
                .foregroundColor(.gray)
            
        }
        .padding()
        .background(Color.white)
    }
}

struct TopPanelView_Previews: PreviewProvider {
    static var previews: some View {
        TopPanelView()
    }
}
