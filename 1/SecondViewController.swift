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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.isHidden = true
        label.font = label.font.withSize(35)
        label.textAlignment = .center
        label.numberOfLines = 3
        
        segmentedControl.insertSegment(withTitle: "Therd", at: 2, animated: true)

        
    }

    @IBAction func choiceSegment(_ sender: UISegmentedControl) {
        
        label.isHidden = false
        
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
}
