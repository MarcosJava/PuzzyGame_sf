//
//  ConcentrationThemeViewController.swift
//  PuzzyGame
//
//  Created by Marcos Felipe Souza on 19/01/19.
//  Copyright © 2019 Marcos Felipe Souza. All rights reserved.
//

import UIKit

class ConcentrationThemeViewController: UIViewController {

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Choose Theme" {
            guard let button = sender as? UIButton, let name = button.titleLabel?.text else { return }
            let theme:ThemeEnum =  ThemeEnum.byName(name)
            
            guard let vc = segue.destination as? ViewController else { return }
            vc.themeChoice = theme
        }
    }
 

}
