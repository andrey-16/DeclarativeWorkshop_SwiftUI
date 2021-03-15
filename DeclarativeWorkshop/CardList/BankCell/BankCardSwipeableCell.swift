//
//  BankCardSwipeableCell.swift
//  DeclarativeWorkshop
//
//  Created by andrey on 15.03.2021.
//

import SwiftUI

struct BankCardSwipeableCell : View {
    let card: BankCard
    @Binding var cards: [BankCard]
    
    private let width: CGFloat = 80
    @State private var offset = CGSize.zero
    @State private var scale: CGFloat = 0.5
    
    var body : some View {
        GeometryReader { geo in
            HStack (spacing: 0) {
                BankCardView(card: card)
                    .frame(width: positive(value: geo.size.width - 24), height: positive(value: geo.size.height - 8), alignment: .leading)
                    .foregroundColor(Color.white)
                    .cornerRadius(8.0)
                    .padding(.leading, 12)
                    .zIndex(1)

                ZStack {
                    Button(action: {
                        if let index = cards.firstIndex(where: { $0.id == self.card.id }) {
                            cards.remove(at: index)
                        }
                    }) {
                        Image(systemName: "trash")
                    }
                    .font(.system(size: 20))
                    .foregroundColor(.white)
                    .scaleEffect(scale)
                }
                .frame(width: width + 10, height: positive(value: geo.size.height - 8))
                .background(Color.red.opacity(Double(-offset.width/60.0)))
                .clipShape(DeleteButtonShape(radius: 8) )
                .offset(x: -10)
                .onTapGesture {
                    if let index = cards.firstIndex(where: { (item) -> Bool in
                        item.id == self.card.id
                    }) {
                        cards.remove(at: index)
                    }
                }
            }
            // Swipe modifiers:
            .offset(self.offset)
            .animation(.spring())
            .gesture(DragGesture()
                        .onChanged { gesture in
                            self.offset.width = gesture.translation.width
                        }
                        .onEnded { _ in
                            if self.offset.width < -50 {
                                self.scale = 1.2
                                self.offset.width = -80
                            } else {
                                self.scale = 0.3
                                self.offset = .zero
                            }
                        }
            )
        }
        .frame(height: 130)
    }
    
    func positive(value: CGFloat) -> CGFloat {
        if value <= 0 {
            return 0.0
        } else {
            return value
        }
    }
}

struct BankCardSwipeableCell_Previews: PreviewProvider {
    static var previews: some View {
        BankCardSwipeableCell(card: BankCard.cards.first!, cards: .constant(BankCard.cards))
    }
}
