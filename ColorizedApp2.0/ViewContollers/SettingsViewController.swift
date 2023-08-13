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
    
    @IBOutlet var redTextField: UITextField!
    @IBOutlet var greenTextField: UITextField!
    @IBOutlet var blueTextField: UITextField!
    
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
        setValues(for: redTextField, greenTextField, blueTextField)
        
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextField.delegate = self
    
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    // MARK: IBActions
    @IBAction func rgbSliderAction(_ sender: UISlider) {
        switch sender {
        case redSlider:
            setValues(for: redLabel)
            setValues(for: redTextField)
        case greenSlider:
            setValues(for: greenLabel)
            setValues(for: greenTextField)
        default:
            setValues(for: blueLabel)
            setValues(for: blueTextField)
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
            case redLabel: label.text = redSlider.stringValue
            case greenLabel: label.text = greenSlider.stringValue
            default: label.text = blueSlider.stringValue
            }
        }
    }
    private func setValues(for textFields: UITextField...) {
        textFields.forEach { textField in
            switch textField {
            case redTextField: textField.text = redSlider.stringValue
            case greenTextField: textField.text = greenSlider.stringValue
            default: textField.text = blueSlider.stringValue
            }
        }
    }
    private func updateColor() {
        let red = CGFloat(redSlider.value) / 255
        let green = CGFloat(greenSlider.value) / 255
        let blue = CGFloat(blueSlider.value) / 255
        rgbView.backgroundColor = UIColor(
            red: red,
            green: green,
            blue: blue,
            alpha: 1
        )
    }
    private func showAlert(withTitle title: String, andMessage message: String, forTextField textField: UITextField? = nil) {
        
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            guard let textField = textField else { return }
            textField.text = ""
            textField.becomeFirstResponder()
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
}

// MARK: - Slider's string value
extension UISlider {
    var stringValue: String {
        round(value).formatted()
    }
}

extension SettingsViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let keyboardToolbar = UIToolbar()
        keyboardToolbar.sizeToFit()
        textField.inputAccessoryView = keyboardToolbar

        let doneButton = UIBarButtonItem(
            barButtonSystemItem: .done,
            target: textField,
            action: #selector(resignFirstResponder)
        )

        let flexBarButton = UIBarButtonItem(
            barButtonSystemItem: .flexibleSpace,
            target: nil,
            action: nil
        )

        keyboardToolbar.items = [flexBarButton, doneButton]
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text else {
            showAlert(withTitle: "Wrong format!", andMessage: "Please enter correct value")
            return
        }
        guard let currentValue = Float(text), (0...255).contains(currentValue) else {
            showAlert(
                withTitle: "Wrong format!",
                andMessage: "Please enter correct value",
                forTextField: textField
            )
            return
        }

        switch textField {
        case redTextField:
            redSlider.setValue(currentValue, animated: true)
            setValues(for: redLabel)
        case greenTextField:
            greenSlider.setValue(currentValue, animated: true)
            setValues(for: greenLabel)
        default:
            blueSlider.setValue(currentValue, animated: true)
            setValues(for: blueLabel)
        }

        updateColor()
    }
}

