//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Sukrit Chatmeeboon on 27/1/2565 BE.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = SunSetGame()
    var body: some Scene {
        WindowGroup {
            SunSetGameView(game: game)
        }
    }
}


