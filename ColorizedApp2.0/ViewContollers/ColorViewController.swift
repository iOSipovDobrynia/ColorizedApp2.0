//
//  ColorViewController.swift
//  ColorizedApp2.0
//
//  Created by Goodwasp on 12.08.2023.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func setNewColor(with newColor: UIColor)
}

class ColorViewController: UIViewController {
    
    // MARK: - Public properties
    public var defualtColor = UIColor(
        red: CGFloat(191) / 255,
        green: CGFloat(127) / 255,
        blue: CGFloat(63) / 255,
        alpha: 1
    )
        
    // MARK: - Overridee methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = defualtColor
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else {
            return
        }
        settingsVC.color = view.backgroundColor
        settingsVC.delegate = self
    }
}

// MARK: - SettingsViewControllerDelegate
extension ColorViewController: SettingsViewControllerDelegate {
    func setNewColor(with newColor: UIColor) {
        view.backgroundColor = newColor
    }
}
