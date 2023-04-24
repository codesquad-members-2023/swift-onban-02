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
    
    func setHeader() {
        layoutSubviews()
        addSubview(cellView)
        cellView.addSubview(titleLabel)
        
        cellView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            cellView.widthAnchor.constraint(equalTo: self.widthAnchor),
            cellView.heightAnchor.constraint(equalTo: self.heightAnchor),
            cellView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            cellView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            titleLabel.leadingAnchor.constraint(equalTo: cellView.leadingAnchor),
            titleLabel.topAnchor.constraint(equalTo: cellView.topAnchor)
        ])
    }
    
}
