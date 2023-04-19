//
//  HomeViewController.swift
//  OnBanApp
//
//  Created by SONG on 2023/04/19.
//

import UIKit

class HomeViewController: UIViewController {
    
    let collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackCollectionView(collectionView: collectionView)
        
    }
    
    func setBackCollectionView(collectionView: UICollectionView) {
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        
        collectionView.backgroundColor = .cyan
    }
}
