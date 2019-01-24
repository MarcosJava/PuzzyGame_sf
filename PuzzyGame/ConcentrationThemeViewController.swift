//
//  ConcentrationThemeViewController.swift
//  PuzzyGame
//
//  Created by Marcos Felipe Souza on 19/01/19.
//  Copyright © 2019 Marcos Felipe Souza. All rights reserved.
//

import UIKit

class ConcentrationThemeViewController: UIViewController {

    
    override func awakeFromNib() {
        splitViewController?.delegate = self
    }
    
    private var splitViewDetailContrationViewController: ConcentrationViewController? {
        return splitViewController?.viewControllers.last as? ConcentrationViewController
    }
    
    
    
 
    @IBAction func changeTheme(_ sender: UIButton) {
        
        guard let name = sender.titleLabel?.text else { return }
        let theme:ThemeEnum =  ThemeEnum.byName(name)
        
        if let cvc = splitViewDetailContrationViewController {
            cvc.themeChoice = theme
            
        } else if let cvc = lastSeguedToContrationViewController {
            cvc.themeChoice = theme
            navigationController?.pushViewController(cvc, animated: true)
        } else {
            performSegue(withIdentifier: "Choose Theme", sender: sender)
        }
    }
    
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Choose Theme" {
            guard let button = sender as? UIButton, let name = button.titleLabel?.text else { return }
            let theme:ThemeEnum =  ThemeEnum.byName(name)
            
            guard let cvc = segue.destination as? ConcentrationViewController else { return }
            cvc.themeChoice = theme
            self.lastSeguedToContrationViewController = cvc
        }
    }
    
    private var lastSeguedToContrationViewController: ConcentrationViewController?
}


extension ConcentrationThemeViewController: UISplitViewControllerDelegate {
    func splitViewController(_ splitViewController: UISplitViewController,
                             collapseSecondary secondaryViewController: UIViewController,
                             onto primaryViewController: UIViewController) -> Bool {
        
        if let cvc = secondaryViewController as? ConcentrationViewController {
            return cvc.themeChoice == nil
        }
        return false
    }
}
