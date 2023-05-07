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
        let collection = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCollectionView()
        collectionView.dataSource = self
        collectionView.delegate = self
        setNavigationBar()
    }
    
    func setCollectionViewLayoutItemSize() {
        let layout = UICollectionViewFlowLayout()
        let width = UIScreen.main.bounds.width * 0.94
        let height = width / 2.2
        layout.itemSize = CGSize(width: width, height: height)
        collectionView.setCollectionViewLayout(layout, animated: false)
    }
    
    func setNavigationBar() {
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        
        navigationBar.backgroundColor = .white
        navigationBar.isTranslucent = false
        navigationBar.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        navigationBar.layer.shadowOpacity = 0.1
        navigationBar.layer.shadowRadius = 0.0
        view.addSubview(navigationBar)
        
        navigationBar.layer.masksToBounds = false
        navigationBar.layer.shadowPath = UIBezierPath(rect: navigationBar.bounds).cgPath
        
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
    
    func setCollectionView() {
        view.addSubview(collectionView)
        setCollectionViewLayoutItemSize()
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 64.0),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor)
        ])
        
        collectionView.register(FoodCategoryCollectionViewCell.self, forCellWithReuseIdentifier: FoodCategoryCollectionViewCell.identifier)
        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderView.identifier)
    }
    
}

extension HomeViewController: UICollectionViewDelegate {
    
}

extension HomeViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderView.identifier, for: indexPath) as! HeaderView
            headerView.setHeader()
            headerView.configure(withTitle: "HEADER \(indexPath.section + 1)")
            return headerView
        default:
            return UICollectionReusableView()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FoodCategoryCollectionViewCell.identifier, for: indexPath) as? FoodCategoryCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configure(withTitle: "ITEM\(indexPath.row + 1)")
        return cell
    }
    
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 0, bottom: 24, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let width = view.frame.width
        let height = width / 2.2
        return CGSize(width: width, height: height)
    }
}
