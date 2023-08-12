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
        
    // MARK: - Overridee methods
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViewColor(with: sliderValues)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else {
            return
        }
        settingsVC.sliderValues = sliderValues
        settingsVC.delegate = self
    }
    
    // MARK: - Private func
    private func updateViewColor(with values: (red: Float, green: Float, blue: Float)) {
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

// MARK: - SettingsViewControllerDelegate
extension ColorViewController: SettingsViewControllerDelegate {
    func setNewColor(with values: (red: Float, green: Float, blue: Float)) {
        sliderValues = values
        
        updateViewColor(with: values)
    }
}
