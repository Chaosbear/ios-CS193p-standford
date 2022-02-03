//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Non Monthon on 25/1/2565 BE.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    
    private var theme: Theme
    private(set) var color: Color

    
    private static func createMemoryGame(theme: Theme) -> MemoryGame<String> {
        let emojis = theme.emojis.shuffled()
        let numberOfPairsOfCards = theme.numberOfPairs <= theme.emojis.count ? theme.numberOfPairs : theme.emojis.count
        return MemoryGame<String>(numberOfPairsOfCards: numberOfPairsOfCards) {
            pairIndex in emojis[pairIndex]
        }
    }
    
    @Published private var model: MemoryGame<String>
    
    init() {
        let startTheme = Theme.allThemes[3]
        theme = startTheme
        color = Color(name: theme.color) ?? .blue
        model = Self.createMemoryGame(theme: theme)
    }

    var cards: Array<Card> {
        return model.cards
    }
    
    var themeName: String {
          theme.name
    }
    
    var score: Int {
        model.score
    }
    
    //MARK: -Intend(s)
    func choose (_ card: Card) {
        model.choose(card)
    }
    
    func newGame() {
        let oldTheme = theme
        while theme.name == oldTheme.name {
            theme = Theme.allThemes.randomElement()!
        }
        color = Color(name: theme.color) ?? .blue
        model = Self.createMemoryGame(theme: theme)
    }
    
}

extension Color {
    // Helper to initialize a Color based on its name
    init?(name: String) {
        switch name {
        case "red":
            self = .red
        case "green":
            self = .green
        case "blue":
            self = .blue
        case "yellow":
            self = .yellow
        case "orange":
            self = .orange
        case "pink":
            self = .pink
        case "black":
            self = .black
        case "gray":
            self = .gray
        default:
            return nil
        }
    }
}
