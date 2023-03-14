//
//  ViewController.swift
//  MoviesApp
//
//  Created by Amaal Almutairi on 20/08/1444 AH.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollview: UIScrollView!
    
    @IBOutlet weak var collectionview: UICollectionView!
     
    @IBOutlet weak var cvWidth: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }


}

extension ViewController {
    
    func setupCollectionView(){
        
        collectionview.delegate = self
        collectionview.dataSource = self
        cvWidth.constant = 5000
        scrollview.contentSize = collectionview.frame.size
        
    }
}


extension ViewController: UICollectionViewDelegate {
    
}

extension ViewController: UICollectionViewDataSource {
     
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        30 
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
    
}
