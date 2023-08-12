//
//  ColorViewController.swift
//  ColorizedApp2.0
//
//  Created by Goodwasp on 12.08.2023.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func setNewColor(with values: (red: Float, green: Float, blue: Float))
}

class ColorViewController: UIViewController {
    
    // MARK: - Public properties
    var sliderValues = (red: Float(191), green: Float(127), blue: Float(63))
    var selectedColor = UIColor(
        red: CGFloat(191) / 255,
        green: CGFloat(127) / 255,
        blue: CGFloat(63) / 255,
        alpha: 1
    )
    
    // MARK: - Overridee methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = selectedColor
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else {
            return
        }
        settingsVC.sliderValues = sliderValues
        settingsVC.delegate = self
    }
}

// MARK: - SettingsViewControllerDelegate
extension ColorViewController: SettingsViewControllerDelegate {
    func setNewColor(with values: (red: Float, green: Float, blue: Float)) {
        sliderValues = values
        
        let red = CGFloat(values.red)
        let green = CGFloat(values.green)
        let blue = CGFloat(values.blue)
        view.backgroundColor = UIColor(
            red: red / 255,
            green: green / 255,
            blue: blue / 255,
            alpha: 1
        )
    }
}
