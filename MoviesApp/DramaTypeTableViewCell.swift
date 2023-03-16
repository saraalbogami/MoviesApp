//
//  DramaTypeTableViewCell.swift
//  MoviesApp
//
//  Created by Amaal Almutairi on 23/08/1444 AH.
//

import UIKit

class DramaTypeTableViewCell: UITableViewCell {

    @IBOutlet weak var DramaTypeCollectionv: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        DramaTypeCollectionv.delegate = self
        DramaTypeCollectionv.dataSource = self
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}




extension DramaTypeTableViewCell:UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data[collectionView.tag].movies.count
//        return data[collectionView.tag].movies.count
    }
    //collectionCellHighRated
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! DramaTypeCollectionViewCell
        return cell
    }
    
    
    
        //collectionCellHighRated
        //collectionCell
        
        
        
//        cell.imageHighRated.image = MovieData.
//        cell.name =""
//        let cellMovieType = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath)
//        return cell
//        return [cell,cellMovieType]
   // }
    
        
    
    
}
