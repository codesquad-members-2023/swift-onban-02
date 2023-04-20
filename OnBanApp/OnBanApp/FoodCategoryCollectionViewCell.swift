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
        cell.backgroundColor = .cyan
        return cell
    }()
}
