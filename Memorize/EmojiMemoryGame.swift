//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Vlad Spreys on 17/1/21.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    @Published private var model: MemoryGame<String> = createMemoryGame()

    private static func createMemoryGame() -> MemoryGame<String> {
        let emojis: Array<String> = ["👻", "🎃", "🕷", "🦇", "💀"]

        return MemoryGame<String>(numberOfPairsOfCards: Int.random(in: 2..<5)) { pairIndex in
            return emojis[pairIndex]
        }
    }

    // MARK: - Access to the Model
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }

    // MARK: - Intent(s)
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
