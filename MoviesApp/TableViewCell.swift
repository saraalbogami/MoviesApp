//
//  TableViewCell.swift
//  MoviesApp
//
//  Created by Amaal Almutairi on 22/08/1444 AH.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    var movies:[MoviesData] = []
    var ratesMovie:[RateMovie] = []
    
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
        featchMovies()
        
        startTimer()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var timer: Timer?
    var currentCellIndex = 0
    
    func featchMovies() {
        let movieURL = "https://7f51f255-70c2-4d57-a519-652683a43e1d.mock.pstmn.io/movies"
        // https://4855c3e4-c1ea-4aec-84dc-621e909c441d.mock.pstmn.io/movies

       
      let task = URLSession.shared.dataTask(with: URL(string:movieURL)!,completionHandler: { data, response, error in
                
                guard let data = data, error == nil else {
                    print("somthing went wrong \(error?.localizedDescription)")
                    print(data ?? "no data ")
                    return
                }
          
          if let response = response {
              print(response)

          }
            
            do{
                // have data
                self.movies = try JSONDecoder().decode([MoviesData].self, from: data)
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
                
            }catch{
               print("failed to convert")
            }

          print(self.movies)
  
         

        })
        
        task.resume()
       
        
        
      
    }
    
    func fetchRateMovie(){
        let movieURL = "https://7f51f255-70c2-4d57-a519-652683a43e1d.mock.pstmn.io/moviesDirectors/:movie_id"
        
//    https://7f51f255-70c2-4d57-a519-652683a43e1d.mock.pstmn.io/reviews/:movie_id
    }
    
    func startTimer(){
        //
//        if currentCellIndex != 0 {
//            timer = Timer.scheduledTimer(timeInterval: 2.5, target: self, selector: #selector(moveToNexIndex), userInfo: nil, repeats: true)
//        }
      
        timer = Timer.scheduledTimer(timeInterval: 2.5, target: self, selector: #selector(moveToNexIndex), userInfo: nil, repeats: true)
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
        let imagetoString = movies[indexPath.row].moviePoster
        if let url = URL(string: imagetoString){
            if  let data = try? Data(contentsOf: url) {
                cell.imageHighRated.image = UIImage(data: data)
            }
        }
//        cell.starsImg.image = UIImage(named: movies[indexPath.row])
        cell.movieNameLabel.text = movies[indexPath.row].movieName
        cell.highRatedLable.text = String(movies[indexPath.row].movieIMDBRate)
        cell.duration.text =  movies[indexPath.row].movieDuration
        cell.moveType.text = movies[indexPath.row].movieGenres.first
        return cell
    }
    
    
    //MARK: - UICollectionViewDelegateFlowLayout

       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
       {

           return CGSize(width: UIScreen.main.bounds.width, height: 150)
       }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let vc =
////        let vc = storyboard?.instantiateViewController(withIdentifier: "MovieDetailsVC") as? MovieDetailsVC
//    }
        
//        cell.imageHighRated.image = MovieData.
//        cell.name =""
//        let cellMovieType = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath)
//        return cell
//        return [cell,cellMovieType]
   // }
    
  
    
    
}
