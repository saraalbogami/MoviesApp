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
        }else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellTable", for: indexPath) as! DramaTypeTableViewCell
            cell.DramaTypeCollectionv.tag = 1
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellTable2", for: indexPath) as! DramaTypeTableViewCell2
            cell.DramaTypeCollectionv2.tag = 2
            return cell
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        350
    }
    

    
}
