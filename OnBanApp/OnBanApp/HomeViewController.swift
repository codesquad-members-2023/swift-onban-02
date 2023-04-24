//
//  HomeViewController.swift
//  OnBanApp
//
//  Created by SONG on 2023/04/19.
//

import UIKit
//TODO: flowlayout으로 변경
class HomeViewController: UIViewController {
    let navigationBar = UINavigationBar()
    let collectionView: UICollectionView = {
        let layout = HomeViewController.createCompositionLayout()
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCollectionView(collectionView: collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
        setNavigationBar()
    }
    
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
    
    func setCollectionView(collectionView: UICollectionView) {
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 64.0).isActive = true
        collectionView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        
        collectionView.backgroundColor = .white
        collectionView.register(FoodCategoryCollectionViewCell.self, forCellWithReuseIdentifier: FoodCategoryCollectionViewCell.identifier)
    }
    // TODO: 여기 고정값들 바꿔. 그리고 변수명도 이상하다.
    static func createCompositionLayout() -> UICollectionViewCompositionalLayout {
        // sizeSetting
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.95), heightDimension: .fractionalHeight(0.97))
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.25))
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

extension HomeViewController: UICollectionViewDelegate {
    
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FoodCategoryCollectionViewCell.identifier, for: indexPath) as? FoodCategoryCollectionViewCell else {
            exit(0)
        }
        cell.configure(withTitle: "ITEM\(indexPath.row + 1)")
        return cell
    }
    
}
