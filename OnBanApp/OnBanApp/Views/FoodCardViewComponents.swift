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
    
    private(set) var explanation: UILabel = {
        let explanation = UILabel()
        explanation.textRect(forBounds: CGRect(), limitedToNumberOfLines: 1)
        explanation.text = "제 이름은 홍길동입니다."
        explanation.textAlignment = .left
        explanation.font = UIFont.systemFont(ofSize: UIScreen.main.bounds.height*(8/375), weight: .medium)
        explanation.textColor = .lightGray
        return explanation
    }()
    
    private(set) var price: [UILabel] = {
        let originalPrice = UILabel()
        let discountedPrice: UILabel? = UILabel()
        
        originalPrice.text = "15,800원"
        originalPrice.font = UIFont.systemFont(ofSize: UIScreen.main.bounds.height*(8/375), weight: .medium)
        originalPrice.textColor = .lightGray
        let attributedString = NSMutableAttributedString(string: originalPrice.text ?? "")
        attributedString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSMakeRange(0, attributedString.length))
        originalPrice.attributedText = attributedString
        
        guard let discountedPrice = discountedPrice else {
            let price: [UILabel] = [originalPrice]
            return price
        }
        discountedPrice.text = "12,640원"
        discountedPrice.font = UIFont.systemFont(ofSize: UIScreen.main.bounds.height*(8/375), weight: .bold)
        discountedPrice.textColor = .black
        
        let price: [UILabel] = [discountedPrice, originalPrice]
        
        return price
    }()
    
    private(set) var tag: [UILabel] = {
        let orange: UILabel = {
            let label = UILabel()
            label.text = "BEST"
            label.textAlignment = .center
            label.textColor = .white
            label.backgroundColor = UIColor(red: 0.992, green: 0.587, blue: 0.112, alpha: 1.0)
            label.font = UIFont.systemFont(ofSize: UIScreen.main.bounds.height*(5/375), weight: .bold)
            label.clipsToBounds = true
            label.layer.cornerRadius = 15
            return label
        }()
        
        let yellow: UILabel = {
            let label = UILabel()
            label.text = "NEW"
            label.textAlignment = .center
            label.textColor = .white
            label.backgroundColor = UIColor(red: 1.0, green: 0.741, blue: 0.075, alpha: 1.0)
            label.font = UIFont.systemFont(ofSize: UIScreen.main.bounds.height*(5/375), weight: .bold)
            label.clipsToBounds = true
            label.layer.cornerRadius = 15
            return label
        }()
        
        let blue: UILabel = {
            let label = UILabel()
            label.text = ""
            label.textAlignment = .center
            label.textColor = .white
            label.backgroundColor = UIColor(red: 0.0, green: 0.478, blue: 1, alpha: 1.0)
            label.font = UIFont.systemFont(ofSize: UIScreen.main.bounds.height*(5/375), weight: .bold)
            label.clipsToBounds = true
            label.layer.cornerRadius = 15
            return label
        }()
        return [orange, yellow, blue, UILabel()]
    }()
}
