//
//  SecondViewController.swift
//  1
//
//  Created by egor aleksandrovich on 12.12.2022.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var miniView: UIView!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var slider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        slider.value = 1
        
//        label.isHidden = true
        label.text = String(slider.value)
        label.font = label.font.withSize(35)
        label.textAlignment = .center
        label.numberOfLines = 3
        
        segmentedControl.insertSegment(withTitle: "Therd", at: 2, animated: true)

        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.minimumTrackTintColor = .green
        slider.maximumTrackTintColor = .red
        slider.thumbTintColor = .blue
        
        datePicker.locale = Locale(identifier: "ru_RU")
        
    }

    @IBAction func choiceSegment(_ sender: UISegmentedControl) {
        
//        label.isHidden = false
        
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            label.text = "The first segment is selected"
            label.textColor = .red
        case 1:
            label.text = "The second segment is selected"
            label.textColor = .blue
        case 2:
            label.text = "The therd segment is selected"
            label.textColor = .yellow
        default:
            print("Error")
        }
    }
    
    @IBAction func sliderAction(_ sender: UISlider) {
        
        label.textColor = .black
        label.text = String(sender.value)
        
        let backgroundColor = self.view.backgroundColor
        let backgroundColorMini = miniView.backgroundColor
        self.view.backgroundColor = backgroundColor?.withAlphaComponent(CGFloat(sender.value))
        miniView.backgroundColor = backgroundColorMini?.withAlphaComponent(CGFloat(sender.value))
    }
    
    @IBAction func donePressed(_ sender: UIButton) {
        
        label.textColor = .black
        guard textField.text?.isEmpty == false else { return }
        
        if let _ = Double(textField.text!) {
            let alert = UIAlertController(title: "Wrong format", message: "Please enter your name", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default)
            alert.addAction(okAction)
            present(alert, animated: true)
            textField.text = nil
//            print("Name format is wrong")
        } else {
            label.text = textField.text
            textField.text = nil
        }
    }
    
    @IBAction func changeDate(_ sender: UIDatePicker) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
//        dateFormatter.locale = Locale(identifier: <#T##String#>)
        
        let dateValue = dateFormatter.string(from: sender.date)
        label.text = dateValue
    }
}
