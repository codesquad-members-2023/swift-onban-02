//
//  YellowBadgeView.swift
//  OnBanApp
//
//  Created by SONG on 2023/05/06.
//

import UIKit

class YellowBadgeView: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    func setupView() {
        self.text = "NEW"
        self.textAlignment = .center
        self.textColor = .white
        self.backgroundColor = UIColor(red: 1.0, green: 0.741, blue: 0.075, alpha: 1.0)
        self.font = UIFont.systemFont(ofSize: UIScreen.main.bounds.height*(5/375), weight: .bold)
        self.clipsToBounds = true
        self.layer.cornerRadius = 15
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        guard let superview = self.superview else {
            return
        }
        
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            self.widthAnchor.constraint(equalTo: superview.widthAnchor, multiplier: 0.3),
            self.heightAnchor.constraint(equalTo: superview.heightAnchor)
        ])
    }
}
