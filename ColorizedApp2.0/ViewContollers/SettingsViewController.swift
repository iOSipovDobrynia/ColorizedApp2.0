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
    
    var delegate: SettingsViewControllerDelegate!
        
    // MARK: - Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rgbView.layer.cornerRadius = 10
        rgbView.backgroundColor = color
        setSliderValues()
        setLabels()
    }
    
    // MARK: IBActions
    @IBAction func redSliderAction() {
        updateColor()
        redValueLabel.text = round(redSlider.value).formatted()
    }
    
    @IBAction func greenSliderAction() {
        updateColor()
        greenValueLabel.text = round(greenSlider.value).formatted()
    }
    
    @IBAction func blueSliderAction() {
        updateColor()
        blueValueLabel.text = round(blueSlider.value).formatted()
    }
    
    @IBAction func doneButtonPressed() {
        guard let rgbColor = rgbView.backgroundColor else { return }

        delegate.setNewColor(with: rgbColor)
        dismiss(animated: true)
    }
    
    // MARK: private methods
    private func setSliderValues() {
        guard let rgbColor = rgbView.backgroundColor else { return }
        
        let ciColor = CIColor(color: rgbColor)
        redSlider.value = Float(ciColor.red) * 255
        greenSlider.value = Float(ciColor.green) * 255
        blueSlider.value = Float(ciColor.blue) * 255
    }
    private func setLabels() {
        redValueLabel.text = round(redSlider.value).formatted()
        greenValueLabel.text = round(greenSlider.value).formatted()
        blueValueLabel.text = round(blueSlider.value).formatted()
    }
    private func updateColor() {
        let red = CGFloat(redSlider.value) / 255
        let green = CGFloat(greenSlider.value) / 255
        let blue = CGFloat(blueSlider.value) / 255
        rgbView.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
    }
}

