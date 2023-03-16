//
//  ViewController.swift
//  MoviesApp
//
//  Created by Amaal Almutairi on 20/08/1444 AH.
//

import UIKit




var data = [MovieData(sectionType: "High Rated", movies: ["Top Gun ","4.8 out of 5","Action . 2 hr  9 min"]),MovieData(sectionType: "High Rated", movies: ["Top Gun ","4.8 out of 5","Action . 2 hr  9 min"]),MovieData(sectionType: "High Rated", movies: ["Top Gun ","4.8 out of 5","Action . 2 hr  9 min"])
]

//var data = [MovieData]()


class ViewController: UIViewController {

    @IBOutlet weak var cvWidth: NSLayoutConstraint!
    
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.dataSource = self
        tableview.delegate = self
        
    }


}

//extension ViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        if collectionView == dramaCollectionView {
//            return dramaMovies.count
//        } else {
//            return sciFiMovies.count
//        }
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath) as! MovieCell
//
//        if collectionView == dramaCollectionView {
//            cell.configure(with: dramaMovies[indexPath.item])
//        } else {
//            cell.configure(with: sciFiMovies[indexPath.item])
//        }
//
//        return cell
//    }
//}
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeFor

extension ViewController:UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellTableHighRated", for: indexPath) as! TableViewCell
            cell.collectionView.tag = 0
//            indexPath.section
            return cell
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellTable", for: indexPath) as! DramaTypeTableViewCell
            cell.DramaTypeCollectionv.tag = 1
            return cell
        }
//        }else if indexPath.row == 1 {
//            let cell = tableView.dequeueReusableCell(withIdentifier: "cellTable", for: indexPath) as! DramaTypeTableViewCell
//            cell.collectionView.tag = 1
//            return cell
      
//
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cellTable", for: indexPath) as! TableViewCell
//             cell.collectionView.tag = indexPath.section
//        cell.tableview.text =
//       return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        200
    }
    
    
//        func numberOfSections(in tableView: UITableView) -> Int {
//            return data.count
//        }
   
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//
//        return data[section].sectionType
//    }
    
//    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
//           view.tintColor = .green
//       }
        
    // MARK: - Table view data source
  
    
    
//
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return data.count
//    }
//
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 1
//    }
//
//
//
//     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cellTable", for: indexPath) as! TableViewCell
//        cell.collectionView.tag = indexPath.section
//
////
////        cell.titleLbl.text = titleArr[indexPath.row]
////        cell.subTitleLbl.text = subTitleArr[indexPath.row]
////        cell.detailLbl.text = detailArr[indexPath.row]
//
//
//        return cell
//    }
//
//     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 130
//    }
//
//     func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return data[section].sectionType
//    }
//
//    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
//        view.tintColor = .black
//    }
    
}



















//
////MARK:. Data CollectionView
//extension ViewController: UICollectionViewDelegate {
//
//}
//
//extension ViewController: UICollectionViewDataSource {
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        30
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        <#code#>
//    }
//
//
//}
//    @IBOutlet weak var scrollview: UIScrollView!

//    @IBOutlet weak var collectionview: UICollectionView!
//extension ViewController {
    
//    func setupCollectionView(){
        
//        collectionview.delegate = self
//        collectionview.dataSource = self
//        cvWidth.constant = 5000
//        scrollview.contentSize = collectionview.frame.size
        
//    }
//}

