//
//  InnerStackView.swift
//  OnBanApp
//
//  Created by SONG on 2023/05/06.
//

import UIKit

class PriceInnerStackView: UIStackView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        let sPrice = SPriceView(frame: CGRect())
        let nPrice = NPriceView(frame: CGRect())
        self.addArrangedSubview(sPrice)
        self.addArrangedSubview(nPrice)
        
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
