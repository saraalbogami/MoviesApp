//
//  DramaTypeTableViewCell.swift
//  MoviesApp
//
//  Created by Amaal Almutairi on 23/08/1444 AH.
//

import UIKit

class DramaTypeTableViewCell: UITableViewCell {

    var actors:[Actors] = []

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




    extension DramaTypeTableViewCell:UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return actors.count
//        return data[collectionView.tag].movies.count
    }
    //collectionCellHighRated
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! DramaTypeCollectionViewCell
        cell.DramaTypeImage.image = UIImage(named:actors[indexPath.count].actorImage)
        return cell
    }
    
        
        //MARK: - UICollectionViewDelegateFlowLayout

           func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
           {

               return CGSize(width: 200, height: 400)
           }
        
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 0
        }
  
        
    
    
}
