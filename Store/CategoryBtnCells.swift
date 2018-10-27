//
//  CategoryBtnCells.swift
//  Store
//
//  Created by Jonathan on 10/26/18.
//  Copyright © 2018 Jonathan. All rights reserved.
//

import UIKit

class CategoryBtnCells: UICollectionViewCell {
    
    let categoryType:UILabel = {
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.text = "Living Room"
        text.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        text.textColor = UIColor(red:0.04, green:0.55, blue:1.00, alpha:1.0)
        return text
    }()
    
    
    let shadowView:UIView = {
        let shadow = UIView()
        shadow.translatesAutoresizingMaskIntoConstraints = false
        shadow.layer.cornerRadius = 15.5
        shadow.clipsToBounds = false
        // shadow.layer.shadowColor = UIColor(red:0.93, green:0.95, blue:0.96, alpha:1.00).cgColor
        // shadow.layer.shadowOpacity = 0.7
        shadow.layer.shadowColor = UIColor.lightGray.cgColor
        shadow.layer.shadowRadius = 1
        shadow.layer.shadowOpacity = 0.2
        shadow.layer.shadowOffset = CGSize(width: 0, height: 1)
        shadow.backgroundColor = .white
        return shadow
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.clipsToBounds = false
        setupUI()
    }
    
    func setupUI() {
        self.addSubview(shadowView)
        NSLayoutConstraint.activate([
            shadowView.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0),
            shadowView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0),
            shadowView.widthAnchor.constraint(equalTo: self.widthAnchor, constant: 0),
            shadowView.heightAnchor.constraint(equalTo: self.heightAnchor, constant: 0)
            ])
        
        shadowView.addSubview(categoryType)
        NSLayoutConstraint.activate([
            categoryType.centerXAnchor.constraint(equalTo: shadowView.centerXAnchor),
            categoryType.centerYAnchor.constraint(equalTo: shadowView.centerYAnchor)
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
