//
//  MemoryGame.swift
//  Memorize
//
//  Created by Non Monthon on 25/1/2565 BE.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    
    private(set) var cards: Array<Card>
    private(set) var score: Int = 0
    
//    private var indexOfOneAndOnlyFaceUpCard: Int? {
//        get { cards.indices.filter { cards[$0].isFaceUp }.oneAndOnly }
//        set { cards.indices.forEach { cards[$0].isFaceUp = ($0 == newValue) } }
//    }
    private var indexOfOneAndOnlyFaceUpCard: Int?
    
    mutating func choose (_ card: Card) {

//        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id}),
//            !cards[chosenIndex].isFaceUp,
//            !cards[chosenIndex].isMatch {
//
//            if let potentialMatchIndex = indexOfOneAndOnlyFaceUpCard {
//                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
//                    cards[chosenIndex].isMatch = true
//                    cards[potentialMatchIndex].isMatch = true
//
//                    score += 2
//                } else if cards[chosenIndex].isAlreadySeen || cards[potentialMatchIndex].isAlreadySeen {
//                    score -= 1
//                }
//                cards[chosenIndex].isFaceUp = true
//            } else {
//                indexOfOneAndOnlyFaceUpCard = chosenIndex
//                cards[chosenIndex].isAlreadySeen = true
        //            }
        //        }
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id}),
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatch
        {
            if let potentialMatchIndex = indexOfOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatch = true
                    cards[potentialMatchIndex].isMatch = true
                    
                    score += 2
                } else if cards[chosenIndex].isAlreadySeen || cards[potentialMatchIndex].isAlreadySeen {
                    score -= 1
                }
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                for index in cards.indices {
                    if cards[index].isFaceUp {
                        cards[index].isAlreadySeen = true
                    }
                    cards[index].isFaceUp = false
                    
                }
                indexOfOneAndOnlyFaceUpCard = chosenIndex
            }
            cards[chosenIndex].isFaceUp = true
        }
        
    }

    
    init (numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = []
        
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
        cards.shuffle()
    }
    
    struct Card: Identifiable {
        var isFaceUp = false
        var isMatch = false
        var isAlreadySeen = false
        let content: CardContent
        let id: Int
    }
}

extension Array {
    var oneAndOnly: Element? {
        if count == 1 {
            return first
        } else {
            return nil
        }
    }
}
