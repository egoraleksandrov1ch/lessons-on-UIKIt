//
//  CoverInfoVC.swift
//  1
//
//  Created by egor aleksandrovich on 17.12.2022.
//

import UIKit

class CoverInfoVC: UIViewController {

    @IBOutlet weak var coverLabel: UILabel!
    @IBOutlet weak var coverImage: UIImageView!
    
    var textLabel = ""
    var imageCover: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        coverImage.image = imageCover
        coverLabel.text = textLabel
        coverLabel.numberOfLines = 0
    }

}
