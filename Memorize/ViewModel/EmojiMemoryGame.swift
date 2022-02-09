//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Non Monthon on 25/1/2565 BE.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
  @Published private var model: MemoryGame<String>
  let chosenTheme: Theme

  static func createMemoryGame(of theme: Theme) -> MemoryGame<String> {
    let emojis = theme.emojis.map { String($0) }.shuffled()

    return MemoryGame(numberOfPairsOfCards: theme.numberOfPairsOfCards) { index in
      emojis[index]
    }
  }

  init(theme: Theme) {
    chosenTheme = theme
    model = EmojiMemoryGame.createMemoryGame(of: chosenTheme)
  }

  var cards: [MemoryGame<String>.Card] { model.cards }

  var score: Int { model.score }

  // MARK: - Intent(s)

  func choose(_ card: MemoryGame<String>.Card) {
    model.choose(card)
  }

  func startNewGame() {
    model = EmojiMemoryGame.createMemoryGame(of: chosenTheme)
  }
}
