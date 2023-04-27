//
//  FoodCardView.swift
//  OnBanApp
//
//  Created by SONG on 2023/04/25.
//

import UIKit

struct FoodCardViewComponents {
    private(set) var photo: UIImageView = {
        return UIImageView(image: UIImage(named: "abcd.jpeg"))
    }()
    
    private(set) var title: UILabel = {
        let title = UILabel()
        title.textRect(forBounds: CGRect(), limitedToNumberOfLines: 1)
        title.text = "안녕하세요"
        title.textAlignment = .left
        title.font = UIFont.systemFont(ofSize: UIScreen.main.bounds.height*(8/375), weight: .bold)
        return title
    }()
}
