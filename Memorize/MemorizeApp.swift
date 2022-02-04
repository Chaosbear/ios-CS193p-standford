//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Sukrit Chatmeeboon on 27/1/2565 BE.
//

import SwiftUI

@main
struct MemorizeApp: App {
    private let game = SetGame()
    var body: some Scene {
        WindowGroup {
            SetGameView(game: game)
        }
    }
}


