//
//  Description.swift
//  OnBanApp
//
//  Created by SONG on 2023/05/06.
//

import UIKit

class DescriptionView: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    func setupView() {
        self.text = "제 이름은 홍길동입니다."
        self.textAlignment = .left
        self.font = UIFont.systemFont(ofSize: UIScreen.main.bounds.height*(8/375), weight: .medium)
        self.textColor = .lightGray
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        guard let superview = self.superview else {
            return
        }
        
        guard let lastSubViewInSuperView = superview.subviews.last else {
            return
        }
        
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: lastSubViewInSuperView.bottomAnchor),
            self.leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            self.trailingAnchor.constraint(equalTo: superview.trailingAnchor),
            self.heightAnchor.constraint(equalTo: superview.heightAnchor, multiplier: 0.25)
        ])
    }
}
