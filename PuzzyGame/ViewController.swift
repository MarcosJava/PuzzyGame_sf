//
//  ViewController.swift
//  PuzzyGame
//
//  Created by Marcos Felipe Souza on 27/12/18.
//  Copyright © 2018 Marcos Felipe Souza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var newGameButton: UIButton!
    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    @IBOutlet weak var pointLabel: UILabel!
    @IBOutlet weak var themeLabel: UILabel!
    
    
    var themeChoice: ThemeEnum? {
        didSet {
            guard let theme = themeChoice else { return }
            self.emojiChoices = theme.getCardsByThemes()
        }
    }
    var score = 0 {
        didSet {
            self.pointLabel.text = "Score: \(score)"
        }
    }
    
    var flipCount: Int! {
        didSet {
            updateFlipCountLabel()
        }
    }
    
    private func updateFlipCountLabel() {
        let attributes: [NSAttributedString.Key: Any] = [
            .strokeWidth : 5.0,
            .strokeColor : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        ]
        let attributedString = NSAttributedString(string: "Flips: \(flipCount!)", attributes: attributes)
        flipCountLabel.attributedText = attributedString
    }
    
    var numberOfPairsOfCards: Int {
        return (self.cardButtons.count + 1) / 2
    }
    private lazy var game: Concentration = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    private var emojiChoices = [String]()
    private var emoji = [Card: String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.newGameButton.layer.cornerRadius = self.newGameButton.bounds.width / 12
        self.newGameButton.layer.masksToBounds = true
        self.flipCount = 0
        if let theme = themeChoice {
            self.themeLabel.text = "\(theme)"
            
        }
    }
    
    @IBAction func touchCard(_ sender: UIButton) {
        if let cardIndex = cardButtons?.firstIndex(of: sender) {
            game.chooseCard(at: cardIndex)
            updateViewFromModel()
        }
    }
    
    @IBAction func touchNewGameButton(_ sender: UIButton) {
        resetView()
        game.resetGame()
        updateViewFromModel()
    }
    private func resetView() {        
        //self.themeChoice = ThemeEnum.getRandomTheme()
        self.emoji = [Card: String]()
    }
    
    private func emoji(for card:Card) -> String {
        if emoji[card] == nil && emojiChoices.count > 0 {
            emoji[card] = emojiChoices.remove(at: emojiChoices.count.arc4random)
        }
        return emoji[card] ?? "?"
    }
    
    private func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: .normal)
                button.backgroundColor = .white
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? UIColor.black : UIColor.orange
            }
            self.score = game.score
            self.flipCount = game.flips
        }
    }
}
