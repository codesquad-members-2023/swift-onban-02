//
//  FoodCategoryCollectionViewCell.swift
//  OnBanApp
//
//  Created by SONG on 2023/04/19.
//

import UIKit

class FoodCategoryCollectionViewCell: UICollectionViewCell {
    static let identifier = "CategoryCell"
    
    private let cellView: UIView = {
        let cell = UIView()
        cell.backgroundColor = .white
        return cell
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()
        
    func setCell() {
        contentView.addSubview(cellView)
        cellView.addSubview(titleLabel)
        cellView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate(
            [cellView.topAnchor.constraint(equalTo: contentView.topAnchor),
            cellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            cellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: cellView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: cellView.leadingAnchor)]
        )
    }

    func configure(withTitle title: String) {
        titleLabel.text = title
    }
}
