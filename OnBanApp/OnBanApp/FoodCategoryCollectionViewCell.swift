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
        cell.backgroundColor = .red
        return cell
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(cellView)
        print(contentView)
        cellView.addSubview(titleLabel)
        
        cellView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate(
            [cellView.topAnchor.constraint(equalTo: contentView.topAnchor),
            cellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            cellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            titleLabel.leadingAnchor.constraint(equalTo: cellView.leadingAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: cellView.leadingAnchor)]
        )
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    func configure(withTitle title: String) {
        titleLabel.text = title
    }
}
