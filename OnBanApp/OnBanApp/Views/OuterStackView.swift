//
//  OuterStackView.swift
//  OnBanApp
//
//  Created by SONG on 2023/05/06.
//

import UIKit

class OuterStackView: UIStackView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        let title = TitleView(frame: CGRect())
        let description = DescriptionView(frame: CGRect())
        let priceInnerStackView = PriceInnerStackView(frame: CGRect())
        let badgeInnerStackView = BadgeInnerStackView(frame: CGRect())
        self.addArrangedSubview(title)
        self.addArrangedSubview(description)
        self.addArrangedSubview(priceInnerStackView)
        self.addArrangedSubview(badgeInnerStackView)
        
        self.axis = .vertical
        self.distribution = .fill
        self.spacing = 0
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        guard let superview = self.superview else {
            return
        }
        
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.trailingAnchor.constraint(equalTo: superview.trailingAnchor),
            self.widthAnchor.constraint(equalTo: superview.widthAnchor, multiplier: 205/343),
            self.heightAnchor.constraint(equalTo: superview.heightAnchor, multiplier: 96/130),
            self.centerYAnchor.constraint(equalTo: superview.centerYAnchor)
        ])
    }
}
