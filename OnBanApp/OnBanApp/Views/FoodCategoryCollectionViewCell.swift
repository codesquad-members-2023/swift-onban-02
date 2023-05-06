//
//  FoodCategoryCollectionViewCell.swift
//  OnBanApp
//
//  Created by SONG on 2023/04/19.
//

import UIKit

class FoodCategoryCollectionViewCell: UICollectionViewCell {
    static let identifier = "CategoryCell"

    func setCell() {
        contentView.backgroundColor = .white
        
        if contentView.subviews.filter({ $0 is PhotoView }).isEmpty {
            contentView.addSubview(PhotoView(image: UIImage(named: "abcd.jpeg")))
        }
        
        if contentView.subviews.filter({ $0 is OuterStackView }).isEmpty {
            contentView.addSubview(OuterStackView(frame: CGRect()))
        }
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        guard let backPlane = contentView.superview else {
            return
        }
        
        NSLayoutConstraint.activate(
            [contentView.topAnchor.constraint(equalTo: backPlane.topAnchor),
             contentView.leadingAnchor.constraint(equalTo: backPlane.leadingAnchor),
             contentView.trailingAnchor.constraint(equalTo: backPlane.trailingAnchor),
             contentView.bottomAnchor.constraint(equalTo: backPlane.bottomAnchor)]
        )
    }
}
