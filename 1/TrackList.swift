//
//  TrackList.swift
//  1
//
//  Created by egor aleksandrovich on 16.12.2022.
//

import UIKit

class TrackList: UITableViewController {
    
    let imageNameArray = ["Bring Me The Horizon - Suicide Season", "Bring Me The Horizon - Can You Feel My Heart", "Bring Me The Horizon - Throne", "Bring Me The Horizon - Diamonds Aren’t Forever", "Bring Me The Horizon - Pray for Plagues", "Bring Me The Horizon - Sleepwalking", "Bring Me The Horizon - Chelsea Smile", "Bring Me The Horizon - Shadow Moses", "Bring Me The Horizon - MANTRA", "Bring Me The Horizon - The House of Wolves"]
    let artCoverArray = ["Suicide Season", "Sempiternal", "That’s the Spirit", "Suicide Season", "Count Your Blessings", "Sempiternal", "Suicide Season", "Sempiternal", "Amo", "Sempiternal"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        self.title = "Bring me the horizon songs"
//        navigationItem.title = "Bring me the horizon songs"
//        navigationController?.navigationBar.prefersLargeTitles = true
        
        
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
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let detailsVC = segue.destination as! DetailVC
                detailsVC.coverImage = artCoverArray[indexPath.row]
                detailsVC.songText = imageNameArray[indexPath.row]
            }
        }
    }
    
    @IBAction func unwindSegueToTrackList(segue: UIStoryboardSegue) {
        
    }

}
