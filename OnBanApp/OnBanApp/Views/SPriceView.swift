//
//  PriceView.swift
//  OnBanApp
//
//  Created by SONG on 2023/05/06.
//

import UIKit

class SPriceView: UILabel {
    //무조건 있는놈
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        self.text = "12,640원"
        self.font = UIFont.systemFont(ofSize: UIScreen.main.bounds.height*(8/375), weight: .bold)
        self.textColor = .black
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        guard let superview = self.superview else {
            return
        }
        
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.widthAnchor.constraint(equalTo: superview.widthAnchor, multiplier: 0.5),
            self.heightAnchor.constraint(equalTo: superview.heightAnchor)
        ])
    }

}
