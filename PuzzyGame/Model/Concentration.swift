//
//  Concentration.swift
//  PuzzyGame
//
//  Created by Marcos Felipe Souza on 27/12/18.
//  Copyright © 2018 Marcos Felipe Souza. All rights reserved.
//

import Foundation



class Concentration {
    
    private(set) var cards = [Card]()
    private var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get {
            return cards.indices.filter { cards[$0].isFaceUp }.oneAndOnly
        }
        set {
            if (newValue != nil) {
                cards.indices.forEach { cards[$0].isFaceUp = ($0 == newValue)}
            }
        }
    }
    var score = 0
    var flips = 0
    init(numberOfPairsOfCards: Int) {
        assert(numberOfPairsOfCards > 0, "Concentraiton.init(\(numberOfPairsOfCards)) you must have at least one pair of cards")
        for _ in 0..<numberOfPairsOfCards {
            let card = Card()
            self.cards += [card, card]
        }
        shuffleCards()
    }
    
    private func shuffleCards() {
        var shuffleArray = [Card]()
        var randomSave = [Int]()
        while self.cards.count != shuffleArray.count {
            let randomIndex = self.cards.count.arc4random
            if !randomSave.contains(randomIndex) {
                randomSave.append(randomIndex)
                shuffleArray.append(self.cards[randomIndex])
            }
        }
        self.cards = shuffleArray
    }
    
    func resetGame() {
        cards.indices.forEach {cards[$0].isMatched = false; cards[$0].isFaceUp = false}
        shuffleCards()
        
        self.score = 0
        self.flips = 0
    }
    
    func chooseCard(at index: Int) {
        assert(cards.indices.contains(index), "Concentration.chooseCard(at: \(index)) chosen index not in the card")
        self.flips += 1
        if !cards[index].isMatched {
            if let matchIndex = self.indexOfTheOneAndOnlyFaceUpCard {
                if matchIndex != index {
                    if cards[matchIndex] == cards[index] {
                        cards[matchIndex].isMatched = true
                        cards[index].isMatched = true
                        
                        cards[matchIndex].isFaceUp = false
                        cards[index].isFaceUp = false
                        self.score += 2
                    
                    } else {
                        cards[index].isFaceUp = true
                        cards[matchIndex].isFaceUp = false
                        self.score -= 1
                    }                    
                }
            } else {
                indexOfTheOneAndOnlyFaceUpCard = index
            }
        }
    }
}

