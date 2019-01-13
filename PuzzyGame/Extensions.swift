//
//  Extensions.swift
//  PuzzyGame
//
//  Created by Marcos Felipe Souza on 29/12/18.
//  Copyright © 2018 Marcos Felipe Souza. All rights reserved.
//

import Foundation

extension Int {
    var arc4random : Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}


extension Collection {
    var oneAndOnly: Element? {
        return count == 1 ? first : nil
    }
}
