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
    var sliderValues: (red: Float, green: Float, blue: Float)!
    
    var delegate: SettingsViewControllerDelegate!
    
    // MARK: - Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rgbView.layer.cornerRadius = 10
        setSliderValues()
        setLabels()
        updateColor(of: rgbView)
        
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
        delegate.setNewColor(with: (redSlider.value, greenSlider.value, blueSlider.value))
        dismiss(animated: true)
    }
    
    // MARK: private methods
    private func updateColor(of view: UIView) {
        let red = CGFloat(redSlider.value) / 255
        let green = CGFloat(greenSlider.value) / 255
        let blue = CGFloat(blueSlider.value) / 255
        view.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
    }
    
    private func setLabels() {
        redValueLabel.text = round(redSlider.value).formatted()
        greenValueLabel.text = round(greenSlider.value).formatted()
        blueValueLabel.text = round(blueSlider.value).formatted()
    }
    
    private func setSliderValues() {
        redSlider.setValue(sliderValues.red, animated: false)
        greenSlider.setValue(sliderValues.green, animated: false)
        blueSlider.setValue(sliderValues.blue, animated: false)
    }
}

