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
        cell.backgroundColor = .systemBackground
        return cell
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.preferredMaxLayoutWidth = UIScreen.main.bounds.width * 0.6
        label.textColor = .black
        label.textAlignment = .natural
        label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let width = UIScreen.main.bounds.width * 0.94
        let height = width * 96/343
        let size = CGSize(width: width, height: height)
        let point = bounds.origin
        
        self.frame.size.width = width
        self.frame.size.height = height
        
        self.center.x = UIScreen.main.bounds.midX
    }
    
    func configure(withTitle title: String) {
        titleLabel.text = title
    }
}
