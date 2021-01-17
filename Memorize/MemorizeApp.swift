//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Vlad Spreys on 17/1/21.
//

import SwiftUI

@main
struct MemorizeApp: App {
    var body: some Scene {
        WindowGroup {
            let game = EmojiMemoryGame()
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
