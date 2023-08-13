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
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
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
        setValues(for: redSlider, greenSlider, blueSlider)
        setValues(for: redLabel, greenLabel, blueLabel)
    }
    
    // MARK: IBActions
    @IBAction func rgbSliderAction(_ sender: UISlider) {
        switch sender {
        case redSlider:
            setValues(for: redLabel)
        case greenSlider:
            setValues(for: greenLabel)
        default:
            setValues(for: blueLabel)
        }
        updateColor()
    }
    
    @IBAction func doneButtonPressed() {
        guard let rgbColor = rgbView.backgroundColor else { return }

        delegate.setNewColor(with: rgbColor)
        dismiss(animated: true)
    }
    
    // MARK: private methods
    private func setValues(for sliders: UISlider...) {
        guard let rgbColor = rgbView.backgroundColor else { return }
        let ciColor = CIColor(color: rgbColor)
        
        sliders.forEach { slider in
            switch slider {
            case redSlider: slider.value = Float(ciColor.red) * 255
            case greenSlider: slider.value = Float(ciColor.green) * 255
            default: slider.value = Float(ciColor.blue) * 255
            }
        }
    }
    private func setValues(for labels: UILabel...) {
        labels.forEach { label in
            switch label {
            case redLabel: label.text = round(redSlider.value).formatted()
            case greenLabel: label.text = round(greenSlider.value).formatted()
            default: label.text = round(blueSlider.value).formatted()
            }
        }
    }
    private func updateColor() {
        let red = CGFloat(redSlider.value) / 255
        let green = CGFloat(greenSlider.value) / 255
        let blue = CGFloat(blueSlider.value) / 255
        rgbView.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
    }
}

