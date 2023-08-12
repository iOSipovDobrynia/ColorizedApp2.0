//
//  ViewController.swift
//  ColorizedApp2.0
//
//  Created by Goodwasp on 01.05.2023.
//

import UIKit

class SettingsViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet var rgbView: UIView!
    
    @IBOutlet var redValueLabel: UILabel!
    @IBOutlet var greenValueLabel: UILabel!
    @IBOutlet var blueValueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    // MARK: - Public prop
    var color: UIColor!
    
    // MARK: - Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rgbView.layer.cornerRadius = 10
        rgbView.backgroundColor = color
        
//        updateColor(of: rgbView)
        setValues()
        
    }
    
    // MARK: IBActions
    @IBAction func redSliderAction() {
        updateColor(of: rgbView)
        redValueLabel.text = round(redSlider.value).formatted()
    }
    
    @IBAction func greenSliderAction() {
        updateColor(of: rgbView)
        greenValueLabel.text = round(greenSlider.value).formatted()
    }
    
    @IBAction func blueSliderAction() {
        updateColor(of: rgbView)
        blueValueLabel.text = round(blueSlider.value).formatted()
    }
    
    @IBAction func doneButtonPressed() {
        dismiss(animated: true)
    }
    
    // MARK: private methods
    private func updateColor(of view: UIView) {
        let red = CGFloat(redSlider.value) / 255
        let green = CGFloat(greenSlider.value) / 255
        let blue = CGFloat(blueSlider.value) / 255
        view.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
    }
    
    private func setValues() {
        redValueLabel.text = round(redSlider.value).formatted()
        greenValueLabel.text = round(greenSlider.value).formatted()
        blueValueLabel.text = round(blueSlider.value).formatted()
    }
}

