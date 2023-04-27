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
}
