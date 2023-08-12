//
//  ColorViewController.swift
//  ColorizedApp2.0
//
//  Created by Goodwasp on 12.08.2023.
//

import UIKit

class ColorViewController: UIViewController {
    
    // MARK: - Public properties
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
        settingsVC.color = selectedColor
    }
    
//    @IBAction func editButtonPressed(_ sender: UIBarButtonItem) {
//        guard let color = view.backgroundColor else {
//            return
//        }
//        selectedColor = color
//        performSegue(withIdentifier: "showSettings", sender: nil)
//    }
}
