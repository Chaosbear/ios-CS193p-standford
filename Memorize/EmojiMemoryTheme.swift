//
//  EmojiMemoryTheme.swift
//  Memorize
//
//  Created by Sukrit Chatmeeboon on 1/2/2565 BE.
//

import Foundation
import SwiftUI

struct Theme {
    
    let name: String
    let symbolName: String
    let emojis: [String]
    let color: String
    var numberOfPairs: Int
    
    
    
    init(name: String, symbolName: String, emojis: [String], color: String, numberOfPairs: Int) {
        self.name = name
        self.symbolName = symbolName
        self.emojis = emojis
        self.color = color
        self.numberOfPairs = numberOfPairs
    }
    
    
    static let vehicles = Theme(
        name: "Vehicles",
        symbolName: "car",
        emojis: [
        "🚲","🚂","🚁","🚜","🏎","🚑","🚓","🚒","✈️","🚀","⛵",
        "🛸","🚌","🏍","🛺","🚠","🛵","🚗","🚚","🚇","🛻","🚝"
        ],
        color: "blue",
        numberOfPairs: 8)
    
    static let sports = Theme(
        name: "Sports",
        symbolName: "sportscourt",
        emojis: [
        "⚽️","🏀","🏈","⚾️","🏓","🏏","🥊","🏉","🎾","🏒","🏌️‍♂️",
        "🏇🏻","🏄‍♂️","🚴‍♀️","🏊‍♂️"
        ],
        color: "yellow",
        numberOfPairs: 9)
    
    static let faces = Theme(
        name: "Faces",
        symbolName: "face.smiling",
        emojis: [
        "😃","😆","😇","🥰","🤪","🥳","😢","🥸","🤯","😱","🥶",
        "🥵","🧐","😋","😉","😂"
        ],
        color: "red",
        numberOfPairs: 10)
    
    static let halloween = Theme(
        name: "Halloween",
        symbolName: "wand.and.stars.inverse",
        emojis: ["👻","🎃","🕷","🕸","🧟"],
        color: "orange",
        numberOfPairs: 10
    )
    
    static let things = Theme(
        name: "Things",
        symbolName: "hammer",
        emojis: ["🧶","🎩","🕶","🧵","👑", "👔", "👖", "💍", "🎧"],
        color: "pink",
        numberOfPairs: 6)
    
    static let allThemes: [Theme] = [
        vehicles,
        sports,
        faces,
        halloween,
        things
    ]
}
