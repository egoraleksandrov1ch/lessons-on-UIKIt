//
//  ContentViewController.swift
//  1
//
//  Created by egor aleksandrovich on 25.12.2022.
//

import UIKit

class ContentViewController: UIViewController {

    @IBOutlet weak var presentTextLabel: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var emojiLabel: UILabel!
    
    var presentText = ""
    var emoji = ""
    var curentPage = 0 // number page
    var numberOfPage = 0 // cul pages
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presentTextLabel.text = presentText
        emojiLabel.text = emoji
        pageControl.numberOfPages = numberOfPage
        pageControl.currentPage = curentPage
        
    }

}
