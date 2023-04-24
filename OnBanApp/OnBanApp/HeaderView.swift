//
//  HeaderView.swift
//  OnBanApp
//
//  Created by SONG on 2023/04/24.
//

import UIKit

class HeaderView: UICollectionReusableView {
    static let identifier = "Header"
    
    private let cellView: UIView = {
        let cell = UIView()
        cell.backgroundColor = .blue
        return cell
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        label.text = "HEADER"
        return label
    }()
    
}
