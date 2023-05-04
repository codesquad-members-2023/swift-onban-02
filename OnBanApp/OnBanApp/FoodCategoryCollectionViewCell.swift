//
//  FoodCategoryCollectionViewCell.swift
//  OnBanApp
//
//  Created by SONG on 2023/04/19.
//

import UIKit

class FoodCategoryCollectionViewCell: UICollectionViewCell {
    static let identifier = "CategoryCell"
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()
        
    func setCell() {
        contentView.backgroundColor = .white
        contentView.addSubview(titleLabel)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate(
            [contentView.topAnchor.constraint(equalTo: self.topAnchor),
             contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
             contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
             contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)]
        )
    }

    func configure(withTitle title: String) {
        titleLabel.text = title
    }
}
