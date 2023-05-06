//
//  PhotoView.swift
//  OnBanApp
//
//  Created by SONG on 2023/05/06.
//

import UIKit

class PhotoView: UIImageView {
    
    override init(image: UIImage?) {
        super.init(image: image)

    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)

    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        guard let superview = superview else {
            return
        }
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: superview.topAnchor),
            self.leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            self.widthAnchor.constraint(equalTo: superview.widthAnchor, multiplier: 130 / 343),
            self.bottomAnchor.constraint(equalTo: superview.bottomAnchor)
        ])
    }
}
