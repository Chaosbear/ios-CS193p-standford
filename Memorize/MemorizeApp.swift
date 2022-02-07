//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Sukrit Chatmeeboon on 27/1/2565 BE.
//

import SwiftUI

@main
struct Memorize3_0App: App {
    @StateObject var themeStore = ThemeStore(named: "default")
    
    var body: some Scene {
        WindowGroup {
//            ThemeChooser(store: themeStore)
            ThemeChooser()
                .environmentObject(themeStore)
        }
    }
}
