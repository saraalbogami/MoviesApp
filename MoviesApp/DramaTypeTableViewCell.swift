//
//  DramaTypeTableViewCell.swift
//  MoviesApp
//
//  Created by Amaal Almutairi on 23/08/1444 AH.
//

import UIKit

class DramaTypeTableViewCell: UITableViewCell {

    var movies:[MoviesData] = []

    @IBOutlet weak var DramaTypeCollectionv: UICollectionView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        DramaTypeCollectionv.delegate = self
        DramaTypeCollectionv.dataSource = self
        featchMovies()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
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
                    self.DramaTypeCollectionv.reloadData()
                }
                
            }catch{
               print("failed to convert")
            }

          print(self.movies)
  
         

        })
        
        task.resume()
       
        
        
      
    }
    
    
  

}




    extension DramaTypeTableViewCell:UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
//        return data[collectionView.tag].movies.count
    }
    //collectionCellHighRated
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! DramaTypeCollectionViewCell
        let imagetoString = movies[indexPath.row].moviePoster
        if let url = URL(string: imagetoString){
            if  let data = try? Data(contentsOf: url) {
                cell.DramaTypeImage.image = UIImage(data: data)
            }
        }
//        cell.DramaTypeImage.image = UIImage(named:movies[indexPath.count].moviePoster)
        return cell
    }
    
        
        //MARK: - UICollectionViewDelegateFlowLayout

           func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
           {

               return CGSize(width: 200, height: 400)
           }
        
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 100
            
        }
  
            func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//                let vc =
//                let vc = storyboard?.instantiateViewController(withIdentifier: "MovieDetailsVC") as? MovieDetailsVC
            }
    
    
}
