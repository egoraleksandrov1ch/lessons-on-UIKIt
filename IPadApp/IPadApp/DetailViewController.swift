//
//  DetailViewController.swift
//  IPadApp
//
//  Created by egor aleksandrovich on 17.12.2022.
//

import UIKit

class DetailViewController: UITableViewController {
    
    let imageNameArray = ["Bring Me The Horizon - Suicide Season", "Bring Me The Horizon - Can You Feel My Heart", "Bring Me The Horizon - Throne", "Bring Me The Horizon - Diamonds Aren’t Forever", "Bring Me The Horizon - Pray for Plagues", "Bring Me The Horizon - Sleepwalking", "Bring Me The Horizon - Chelsea Smile", "Bring Me The Horizon - Shadow Moses", "Bring Me The Horizon - MANTRA", "Bring Me The Horizon - The House of Wolves"]
    let artCoverArray = ["Suicide Season", "Sempiternal", "That’s the Spirit", "Suicide Season", "Count Your Blessings", "Sempiternal", "Suicide Season", "Sempiternal", "Amo", "Sempiternal"]

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    // MARK: - Table view data source



    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageNameArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Title", for: indexPath)

        cell.imageView?.image = UIImage(named: artCoverArray[indexPath.row])
        cell.textLabel?.text = imageNameArray[indexPath.row]
        cell.textLabel?.numberOfLines = 0

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let viewController = parent as? ViewController {
            let trackTitle = imageNameArray[indexPath.row]
            let coverTitle = artCoverArray[indexPath.row]
            
            viewController.titleLabel.text = trackTitle
            viewController.imageCover.image = UIImage(named: coverTitle)
        }
    }

    

}
