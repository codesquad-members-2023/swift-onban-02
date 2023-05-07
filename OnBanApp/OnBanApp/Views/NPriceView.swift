//
//  NPriceView.swift
//  OnBanApp
//
//  Created by SONG on 2023/05/06.
//

import UIKit

class NPriceView: UILabel {

    override init(frame:CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        self.text = "15,800원"
        self.font = UIFont.systemFont(ofSize: UIScreen.main.bounds.height*(8/375), weight: .medium)
        self.textColor = .lightGray
        let attributedString = NSMutableAttributedString(string: self.text ?? "")
        attributedString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSMakeRange(0, attributedString.length))
        self.attributedText = attributedString
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
