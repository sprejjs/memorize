//
//  MemoryGame.swift
//  Memorize
//
//  Created by Vlad Spreys on 17/1/21.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>

    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()

        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
        cards.shuffle()
    }

    mutating func choose(card: Card) {
        let chosenIndex: Int = index(of: card)
        cards[chosenIndex].isFaceUp = !cards[chosenIndex].isFaceUp
        print("Card chosen: \(card)")
    }

    func index(of inputCard: Card) -> Int {
        for (index, card) in cards.enumerated() {
            if card.id == inputCard.id {
                return index
            }
        }

        return -1 //TODO
    }

    struct Card: Identifiable {
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
