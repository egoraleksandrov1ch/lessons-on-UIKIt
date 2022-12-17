//
//  PreviewPage.swift
//  1
//
//  Created by egor aleksandrovich on 17.12.2022.
//

import UIKit

private let reuseIdentifier = "ArtCover"

class PreviewPage: UICollectionViewController {
    
    let imageNameArray = ["Bring Me The Horizon - Suicide Season", "Bring Me The Horizon - Can You Feel My Heart", "Bring Me The Horizon - Throne", "Bring Me The Horizon - Diamonds Aren’t Forever", "Bring Me The Horizon - Pray for Plagues", "Bring Me The Horizon - Sleepwalking", "Bring Me The Horizon - Chelsea Smile", "Bring Me The Horizon - Shadow Moses", "Bring Me The Horizon - MANTRA", "Bring Me The Horizon - The House of Wolves"]
    let artCoverArray = ["Suicide Season", "Sempiternal", "That’s the Spirit", "Suicide Season", "Count Your Blessings", "Sempiternal", "Suicide Season", "Sempiternal", "Amo", "Sempiternal"]

    override func viewDidLoad() {
        super.viewDidLoad()
        

        
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "OpenCover" {
            let coverInfoVC = segue.destination as! CoverInfoVC
            let cell = sender as! ArtCoverCell
            coverInfoVC.textLabel = cell.coverText
            coverInfoVC.imageCover = cell.coverImageView.image
        }
    }
    

    // MARK: UICollectionViewDataSource


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return artCoverArray.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ArtCoverCell
        
        cell.coverImageView.image = UIImage(named: artCoverArray[indexPath.row])
        cell.coverText = imageNameArray[indexPath.row]
    
        return cell
    }
    
    @IBAction func unwindSegueToPreviewPage(sugue: UIStoryboardSegue) {
        
    }

}
