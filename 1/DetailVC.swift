//
//  DetailVC.swift
//  1
//
//  Created by egor aleksandrovich on 16.12.2022.
//

import UIKit

class DetailVC: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    var coverImage = ""
    var songText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        image.image = UIImage(named: coverImage)
        titleLabel.text = songText
        titleLabel.numberOfLines = 0
        
        navigationController?.navigationBar.tintColor = .black

        // Do any additional setup after loading the view.
    }
    


}
