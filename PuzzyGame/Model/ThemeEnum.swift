//
//  ThemeEnum.swift
//  PuzzyGame
//
//  Created by Marcos Felipe Souza on 30/12/18.
//  Copyright © 2018 Marcos Felipe Souza. All rights reserved.
//

import Foundation

enum ThemeEnum: Int, CaseIterable {
    case halloween = 0
    case sport, country, music
}

extension ThemeEnum {
    static func getRandomTheme() -> ThemeEnum {
        return ThemeEnum(rawValue: ThemeEnum.allCases.count.arc4random)!
    }
    
    func getCardsByThemes() -> [String] {
        switch self {
        case .halloween:
            return ["🕷", "🦇", "😱", "😈", "👻", "🎃", "👺", "🧟‍♂️", "🧝🏻‍♀️", "🧙🏻‍♂️", "🐭", "➕"]
        case .country:
            return ["🏴󠁧󠁢󠁥󠁮󠁧󠁿", "🇬🇧", "🇯🇲", "🇯🇵", "🇧🇷", "🇧🇪", "🇺🇸", "🇨🇦", "🇫🇷", "🇪🇸", "🇩🇪", "🇦🇷" ]
        case .music:
            return ["🎤", "🎧", "🎻", "🎸", "🥁", "🎹", "🎷", "🎺", "🎼", "📼", "🎙", "📻"]
        case .sport:
            return ["⛹🏻‍♂️", "🚴🏻‍♂️", "🏌🏻‍♂️", "🏋🏻‍♂️", "🏄🏻‍♂️", "⛸", "🧘🏻‍♂️", "🏊🏻‍♂️", "🤺", "🏹", "⚽️", "🏈"]
        }
    }
    
    static func byName(_ name: String) -> ThemeEnum {
        let choosed = name.lowercased()
        switch choosed {
        case "sport":
            return .sport
        case "music":
            return .music
        case "country":
            return .country
        case "halloween":
            return .halloween
        default:
            return .country
        }
    }
}
