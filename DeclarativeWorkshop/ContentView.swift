//
//  ContentView.swift
//  DeclarativeWorkshop
//
//  Created by andrey on 11.03.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                TopPanel()
                
                ScrollView {
                    NavigationLink(
                        destination: DetailView(),
                        label: {
                            BankCard()
                        })
                    NavigationLink(
                        destination: DetailView(),
                        label: {
                            BankCard()
                        })
                    NavigationLink(
                        destination: DetailView(),
                        label: {
                            BankCard()
                        })
                }
                .navigationBarTitle("")
                .navigationBarHidden(true)                
            }
            .background(LinearGradient(gradient: Gradient(colors: [Color.gray.opacity(0.2), Color.gray.opacity(0.5)]), startPoint: .top, endPoint: .bottom))
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

struct BankCard: View {
    var body: some View {
        VStack {
            ZStack {
                Image("earth-logo")
                    .resizable()
                    .frame(width: 250, height: 120, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
                HStack {
                    VStack {
                        HStack {
                            Image("Amex")
                                .resizable()
                                .frame(width: 150, height: 75, alignment: .leading)
                                .offset(x: -10, y: 0)
                            Spacer()
                        }
                        
                        Text("****     ****     ****     2123")
                            .foregroundColor(.white)
                            .font(Font.system(size: 24, weight: .medium, design: .default))
                    }
                    Spacer()
                }
                .padding(.bottom)
                .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0, green: 0.416670382, blue: 0.8357722759, alpha: 1)), Color(#colorLiteral(red: 0, green: 0.416670382, blue: 0.8357722759, alpha: 1)).opacity(0.6)]), startPoint: .center, endPoint: .trailing))
                .cornerRadius(10)
            }
        }
        .padding(.top)
        .padding(.horizontal)
    }
}

struct TopPanel: View {
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
