//
//  TableViewCell.swift
//  MoviesApp
//
//  Created by Amaal Almutairi on 22/08/1444 AH.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    var movies:[MoviesData] = []

    
    @IBOutlet weak var movieType: UILabel!
    
    @IBAction func showMoreBtn(_ sender: Any) {
        
    }
    
   
    @IBOutlet weak var pageControlTopRated: UIPageControl!
    
    @IBOutlet weak var collectionView: UICollectionView!
    


    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
        pageControlTopRated.numberOfPages = movies.count
         featch()
        
        startTimer()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var timer: Timer?
    var currentCellIndex = 0
    
    func featch()  {
        let movieURL = "https://4855c3e4-c1ea-4aec-84dc-621e909c441d.mock.pstmn.io/movies"
        // https://4855c3e4-c1ea-4aec-84dc-621e909c441d.mock.pstmn.io/movies

//       print(movieURL)
       
      let task = URLSession.shared.dataTask(with: URL(string:movieURL)!,completionHandler: { data, response, error in
                
                guard let data = data, error == nil else {
                    print("somthing went wrong \(error?.localizedDescription)")
                    print(data ?? "no data ")
                    return
                }
          
          
          
//
          if let response = response {
              print(response)

          }
                // have data
           // var movies:MoviesData?
            
            do{
                // have data
                self.movies = try JSONDecoder().decode([MoviesData].self, from: data)

            }catch{
               print("failed to convert")
            }
             
//          guard let json = self.movies else {
//                 return
//            }
          print(self.movies)
          
//          print(self.movies[0].movie_name)
//            print(json.movie_name)
//            print(json.movie_IMDb_rate)
//            print(json.movie_genres)
//            print(json.movie_duration)
         

        })
        task.resume()
       
        
        collectionView.reloadData()
      
    }
    func startTimer(){
        //
        if currentCellIndex != 0 {
            timer = Timer.scheduledTimer(timeInterval: 2.5, target: self, selector: #selector(moveToNexIndex), userInfo: nil, repeats: true)
        }
       
    }
    
    @objc func moveToNexIndex(){
        if currentCellIndex < movies.count - 1 {
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
        print("SSS:\(movies.count)")
        return movies.count
//        return data[collectionView.tag].movies.count
    }
    //collectionCellHighRated
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCellHighRated", for: indexPath) as! HighRatedCollectionViewCell
        
        cell.imageHighRated.image =  UIImage(named: movies[indexPath.row].moviePoster)
//        cell.starsImg.image = UIImage(named: movies[indexPath.row])
        cell.movieNameLabel.text = movies[indexPath.row].movieName
        cell.ratedOutOf5.text = String(movies[indexPath.row].movieIMDBRate)
        cell.duration.text = movies[indexPath.row].movieDuration
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
