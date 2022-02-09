//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Sukrit Chatmeeboon on 27/1/2565 BE.
//

import SwiftUI

struct EmojiMemoryGameView: View {
  @ObservedObject var game: EmojiMemoryGame

  var body: some View {
    VStack {
      Text("score: \(game.score)")

        AspectVGrid(items: game.cards, aspectRatio: 2 / 3) { card in
          if card.isMatched && !card.isFaceUp {
            Rectangle().opacity(0)
          } else {
            CardView(card: card)
              .padding(4)
              .onTapGesture {
                game.choose(card)
              }
          }
        }
      .foregroundColor(Color(rgbaColor: game.chosenTheme.color))
    }
    .padding()
    .navigationTitle("\(game.chosenTheme.name)!")
    .toolbar {
      newGameButton
    }
  }

  var newGameButton: some View {
    Button {
      game.startNewGame()
    } label: {
      Text("New Game")
    }
  }
}

struct CardView: View {
  let card: EmojiMemoryGame.Card

  var body: some View {
    GeometryReader { geometry in
      ZStack {
        Text(card.content)
          .rotationEffect(Angle.degrees(card.isMatched ? 360 : 0))
          .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
          .font(Font.system(size: DrawingConstants.fontSize))
          .scaleEffect(scale(thatFits: geometry.size))
      }
      .cardify(isFaceUp: card.isFaceUp)
    }
  }

  private func scale(thatFits size: CGSize) -> CGFloat {
    min(size.width, size.height) / (DrawingConstants.fontSize / DrawingConstants.fontScale)
  }

  private func font(in size: CGSize) -> Font {
    Font.system(size: min(size.width, size.height) * DrawingConstants.fontScale)
  }

  private struct DrawingConstants {
    static let fontScale: CGFloat = 0.7
    static let fontSize: CGFloat = 32
  }
}

// struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        let game = EmojiMemoryGame(theme: ThemeStore(named: "default").themes[0])
//        EmojiMemoryGameView(game: game)
//            .preferredColorScheme(.dark)
//        EmojiMemoryGameView(game: game)
//            .preferredColorScheme(.light)
//    }
// }
