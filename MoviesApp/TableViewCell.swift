//
//  TableViewCell.swift
//  MoviesApp
//
//  Created by Amaal Almutairi on 22/08/1444 AH.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var movieType: UILabel!
    
    @IBAction func showMoreBtn(_ sender: Any) {
        
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    
//    @IBAction func pageControler(_ sender: Any) {
//
//    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


extension TableViewCell:UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return data[collectionView.tag].movies.count
//        return data[collectionView.tag].movies.count
    }
    //collectionCellHighRated
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCellHighRated", for: indexPath) as! HighRatedCollectionViewCell
        return cell
    }
     
        
//        cell.imageHighRated.image = MovieData.
//        cell.name =""
//        let cellMovieType = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath)
//        return cell
//        return [cell,cellMovieType]
   // }
    
  
    
    
}
