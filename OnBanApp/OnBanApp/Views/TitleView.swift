//
//  TitleView.swift
//  OnBanApp
//
//  Created by SONG on 2023/05/06.
//

import UIKit

class TitleView: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        self.text = "안녕하세요"
        self.textAlignment = .left
        self.font = UIFont.systemFont(ofSize: UIScreen.main.bounds.height * (8/375), weight: .bold)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        guard let superview = self.superview else {
            return
        }
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: superview.topAnchor),
            self.leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            self.trailingAnchor.constraint(equalTo: superview.trailingAnchor),
            self.heightAnchor.constraint(equalTo: superview.heightAnchor, multiplier: 0.25)
        ])
    }
}
