//
//  BadgeInnerViewStackView.swift
//  OnBanApp
//
//  Created by SONG on 2023/05/06.
//

import UIKit

class BadgeInnerStackView: UIStackView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        let orange = OrangeBadgeView(frame: CGRect())
        let yellow = YellowBadgeView(frame: CGRect())
        let blue = BlueBadgeView(frame: CGRect())
        self.addArrangedSubview(orange)
        self.addArrangedSubview(yellow)
        self.addArrangedSubview(blue)
        self.addArrangedSubview(UIView())
        self.axis = .horizontal
        self.distribution = .fill
        self.spacing = 4
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        guard let superview = self.superview else {
            return
        }
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            self.widthAnchor.constraint(equalTo: superview.widthAnchor, multiplier: 0.8),
            self.heightAnchor.constraint(equalTo: superview.heightAnchor, multiplier: 0.25)
        ])
    }
}
