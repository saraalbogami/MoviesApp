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
    
   
    @IBOutlet weak var pageControlTopRated: UIPageControl!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
//    @IBAction func pageControler(_ sender: Any) {
//
//    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
        pageControlTopRated.numberOfPages = data.count

        startTimer()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var timer: Timer?
    var currentCellIndex = 0
    
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 2.5, target: self, selector: #selector(moveToNexIndex), userInfo: nil, repeats: true)
       
    }
    
    @objc func moveToNexIndex(){
        if currentCellIndex < data.count - 1 {
            currentCellIndex += 1
            
        }else {
          currentCellIndex = 0
        }
        collectionView.scrollToItem(at: IndexPath(item: currentCellIndex, section: 0), at: .centeredHorizontally, animated: true)
        pageControlTopRated.currentPage = currentCellIndex

    }

}


extension TableViewCell:UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return data[collectionView.tag].movies.count
//        return data[collectionView.tag].movies.count
    }
    //collectionCellHighRated
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCellHighRated", for: indexPath) as! HighRatedCollectionViewCell
        
        
        return cell
    }
    
    
    //MARK: - UICollectionViewDelegateFlowLayout

       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
       {

           return CGSize(width: UIScreen.main.bounds.width, height: 112)
       }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
        
//        cell.imageHighRated.image = MovieData.
//        cell.name =""
//        let cellMovieType = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath)
//        return cell
//        return [cell,cellMovieType]
   // }
    
  
    
    
}
