//
//  DramaTypeTableViewCell2.swift
//  MoviesApp
//
//  Created by Amaal Almutairi on 26/08/1444 AH.
//

import UIKit

class DramaTypeTableViewCell2: UITableViewCell {
    
   
    @IBOutlet weak var DramaTypeCollectionv2: UICollectionView!
    
    var movies:[MoviesData] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        DramaTypeCollectionv2.delegate = self
        DramaTypeCollectionv2.dataSource = self
        // Initialization code
    }
//cellTable2
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

    
    
    extension DramaTypeTableViewCell2:UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
        //        return data[collectionView.tag].movies.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell2", for: indexPath) as! DramaTypeCollectionViewCell2
//        cell.DramaTypeImageCollection2.image = UIImage(named:actors[indexPath.count].actorImage)
        return cell
    }
        
        //MARK: - UICollectionViewDelegateFlowLayout

           func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
           {

               return CGSize(width: 200, height: 400)
           }
        
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 5
        }
}
