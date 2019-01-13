//
//  Card.swift
//  PuzzyGame
//
//  Created by Marcos Felipe Souza on 27/12/18.
//  Copyright © 2018 Marcos Felipe Souza. All rights reserved.
//

import Foundation

struct Card: Hashable {
    var hashValue: Int { return identifier }
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    var isFaceUp: Bool = false
    var isMatched: Bool = false
    private var identifier: Int
    
    private static var identifierFactory = 0
    
    private static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
