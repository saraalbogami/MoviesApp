//
//  ViewController.swift
//  MoviesApp
//
//  Created by Amaal Almutairi on 20/08/1444 AH.
//

import UIKit



class ViewController: UIViewController {
    
    var movies:[MoviesData] = []
    
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.dataSource = self
        tableview.delegate = self
        tableview.reloadData()
    }
    
    
    func moveToMovieDetails(tableIndex:Int, collcIndex:Int){
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "MovieDetailsVC") as? MovieDetailsVC else{
            return
        }
        vc.navigationController?.pushViewController(vc , animated: true)

        
        
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
            
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellTable", for: indexPath) as! DramaTypeTableViewCell
            cell.DramaTypeCollectionv.tag = 1
            cell.didSelectClouser = { tabIndex, collcIndex in
                print("didSelectClouser")
                if let tabIndexp = tabIndex, let collcIndexp = collcIndex {
                    self.moveToMovieDetails(tableIndex: tabIndexp, collcIndex: collcIndexp )
                }

            }
            return cell
        }
        
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        350
    }
    
}
