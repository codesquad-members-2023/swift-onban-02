//
//  HomeViewController.swift
//  OnBanApp
//
//  Created by SONG on 2023/04/19.
//

import UIKit

class HomeViewController: UIViewController {
    let navigationBar = UINavigationBar()
    let collectionView: UICollectionView = {
        let layout = HomeViewController.createCompositionLayout()
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackCollectionView(collectionView: collectionView)
        
        setNavigationBar()
    func setNavigationBar() {
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        
        navigationBar.backgroundColor = .white
        navigationBar.isTranslucent = false
        navigationBar.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        navigationBar.layer.shadowOpacity = 0.1
        navigationBar.layer.shadowRadius = 0.0
        view.addSubview(navigationBar)
        // Navigation Bar Layout 설정
        NSLayoutConstraint.activate([
            navigationBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            navigationBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            navigationBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            navigationBar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40.0)
        ])
        // Navigation Item 생성
        let navigationItem = UINavigationItem()
        navigationItem.title = "오늘찬"
        navigationBar.items = [navigationItem]
    }
    
    func setBackCollectionView(collectionView: UICollectionView) {
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        
        collectionView.backgroundColor = .cyan
    // TODO: 여기 고정값들 바꿔. 그리고 변수명도 이상하다.
    static func createCompositionLayout() -> UICollectionViewCompositionalLayout {
        // sizeSetting
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.97))
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1264.0 / 852.0 ))
        //Item
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        //Group
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, repeatingSubitem: item, count: 1)
        
        //Sections
        let section = NSCollectionLayoutSection(group: group)
        //Return
        return UICollectionViewCompositionalLayout(section: section)
    }
    
}
