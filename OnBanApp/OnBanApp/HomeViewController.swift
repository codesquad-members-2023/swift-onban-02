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
        self.view.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        setCollectionView()
        setNavigationBar()
    }
    
    func setNavigationBar() {
        setNavigationBarAppearance()
        setNavigationBarConstraints()
    }
    
    func setCollectionView() {
        setCollectionViewLayoutItemSize()
        setCollectionViewConstraints()
        registerCollectionViewCell()
    }
    
    func setFoodCardView(cell: FoodCategoryCollectionViewCell) {
        let card = FoodCardViewComponents()
        setPhotoViewConstraints(cell: cell, card: card)
        setStackView(cell: cell, card: card)
    }
    
    func setStackView(cell: FoodCategoryCollectionViewCell, card: FoodCardViewComponents) {
        let outerStackView = UIStackView()
        outerStackView.axis = .vertical
        setLabel(stackView: outerStackView, card: card)
        setTag(outerstackView: outerStackView, card: card)
        setOuterStackViewConstraints(outerStackView: outerStackView, cell: cell)
    }
    
    func setNavigationBarAppearance() {
        navigationBar.backgroundColor = .white
        navigationBar.isTranslucent = false
        navigationBar.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        navigationBar.layer.shadowOpacity = 0.1
        navigationBar.layer.shadowRadius = 0.0
        navigationBar.layer.masksToBounds = false
        navigationBar.layer.shadowPath = UIBezierPath(rect: navigationBar.bounds).cgPath
        
        let navigationItem = UINavigationItem()
        navigationItem.title = "오늘찬"
        navigationBar.items = [navigationItem]
    }
    
    func setNavigationBarConstraints() {
        view.addSubview(navigationBar)
        
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            navigationBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            navigationBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            navigationBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            navigationBar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40.0)
        ])
    }
    
    func setCollectionViewLayoutItemSize() {
        let layout = UICollectionViewFlowLayout()
        let width = UIScreen.main.bounds.width * 0.94
        let height = width / 2.2
        layout.itemSize = CGSize(width: width, height: height)
        collectionView.setCollectionViewLayout(layout, animated: false)
    }
    
    func setCollectionViewConstraints() {
        view.addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 64.0),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor)
        ])
    }
    
    func registerCollectionViewCell() {
        collectionView.register(FoodCategoryCollectionViewCell.self, forCellWithReuseIdentifier: FoodCategoryCollectionViewCell.identifier)
        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderView.identifier)
    }

    func setOuterStackViewConstraints(outerStackView: UIStackView, cell: FoodCategoryCollectionViewCell) {
        cell.addSubview(outerStackView)
        outerStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            outerStackView.trailingAnchor.constraint(equalTo: cell.trailingAnchor),
            outerStackView.widthAnchor.constraint(equalTo: cell.widthAnchor, multiplier: 205/343),
            outerStackView.heightAnchor.constraint(equalTo: cell.heightAnchor, multiplier: 96/130),

            outerStackView.centerYAnchor.constraint(equalTo: cell.centerYAnchor)
        ])
    }
    
    func setPhotoViewConstraints(cell: FoodCategoryCollectionViewCell, card: FoodCardViewComponents ) {
        let photo = card.photo
        cell.addSubview(photo)
        photo.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            photo.leadingAnchor.constraint(equalTo: cell.leadingAnchor),
            photo.widthAnchor.constraint(equalTo: cell.widthAnchor, multiplier: 130/343),
            photo.topAnchor.constraint(equalTo: cell.topAnchor),
            photo.bottomAnchor.constraint(equalTo: cell.bottomAnchor)
        ])
    }
    
    func setLabel(stackView: UIStackView, card: FoodCardViewComponents) {
        let title = card.title
        stackView.insertArrangedSubview(title, at: 0)
        
        title.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            title.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            title.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            title.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 1/4)
        ])
        
        let explanation = card.explanation
        stackView.insertArrangedSubview(explanation, at: 1)

        explanation.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            explanation.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            explanation.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            explanation.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 1/4)
        ])
    }
}

extension HomeViewController: UICollectionViewDelegate {
    
}

extension HomeViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerData = HeaderData()
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderView.identifier, for: indexPath) as? HeaderView else {
                return UICollectionReusableView()
            }
            headerView.setHeader()
            headerView.configure(withTitle: headerData.title[indexPath.section])
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
        cell.setCell()
        setFoodCardView(cell: cell)
        return cell
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 0, bottom: 24, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let width = view.frame.width
        let height = width * 96 / 343
        return CGSize(width: width, height: height)
    }
}
