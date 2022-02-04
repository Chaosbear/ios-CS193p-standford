//
//  SetGameView.swift
//  Memorize
//
//  Created by Sukrit Chatmeeboon on 4/2/2565 BE.
//

import SwiftUI

struct SetGameView: View {
    @ObservedObject var game: SetGame
    var body: some View {

        AspectVGrid(items: cards, aspectRatio: 2/3) { card in
            if card.isMatch && !card.isFaceUp {
                Rectangle().opacity(0)
            } else {
                CardView(card: card)
                    .padding(4)
                    .onTapGesture {
                        game.choose(card)
                    }
            }
        }
        .foregroundColor(.red)
        .padding(.horizontal)
    }
}

struct CardView: View {
    let card: EmojiMemoryGame.Card
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
                if card.isFaceUp {
                    shape
                        .fill()
                        .foregroundColor(.white)
                    shape
                        .strokeBorder(lineWidth: DrawingConstants.lineWidth)
                    Pie(startAngle: Angle(degrees: 0-90), endAngle: Angle(degrees: 110-90) )
                        .padding(5)
                        .opacity(0.5)
                    Text(card.content)
                        .font(font(in: geometry.size))
                } else if card.isMatch {
                    shape.opacity(0)
                } else {
                    shape
                        .fill()
                }
            }
        }
    }
    
    private func font(in size: CGSize) -> Font {
        Font.system(size: min(size.width, size.height) * DrawingConstants.fontScale)
    }
    
    private struct DrawingConstants {
        static let cornerRadius: CGFloat = 20
        static let lineWidth: CGFloat = 3
        static let fontScale: CGFloat = 0.7
    }
}

}

struct SetGameView_Previews: PreviewProvider {
    static var previews: some View {
        let game = SetGame()
        return SetGameView(game: game)
    }
}