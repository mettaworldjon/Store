//
//  CategoryItemCell.swift
//  Store
//
//  Created by Jonathan on 10/28/18.
//  Copyright © 2018 Jonathan. All rights reserved.
//

import UIKit

class CategoryItemCell: UICollectionViewCell {
    
    
    let shadowView:UIView = {
        let shadow = UIView()
        shadow.translatesAutoresizingMaskIntoConstraints = false
        shadow.layer.cornerRadius = 15.5
        shadow.clipsToBounds = false
        shadow.layer.shadowColor = UIColor.lightGray.cgColor
        shadow.layer.shadowRadius = 1
        shadow.layer.shadowOpacity = 0.2
        shadow.layer.shadowOffset = CGSize(width: 0, height: 1)
        shadow.backgroundColor = .white
        return shadow
    }()
    
    let itemImage:UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 15
        image.clipsToBounds = true
        image.heightAnchor.constraint(equalToConstant: 118).isActive = true
        image.widthAnchor.constraint(equalToConstant: 93).isActive = true
        image.image = UIImage(named: "dinningchair")
        return image
    }()
    
    let itemTitle:UILabel = {
        let title = UILabel()
        title.text = "Wood White"
        title.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        title.textColor = UIColor(red:0.29, green:0.29, blue:0.29, alpha:1.0)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    let itemManufacturer:UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "Collection 2018"
        title.textColor = UIColor(red:0.61, green:0.61, blue:0.61, alpha:1.0)
        title.font = .systemFont(ofSize: 12)
        return title
    }()
    
    let itemRating:CosmosView = {
        let cosmosView = CosmosView()
        cosmosView.translatesAutoresizingMaskIntoConstraints = false
        cosmosView.heightAnchor.constraint(equalToConstant: 13).isActive = true
        cosmosView.widthAnchor.constraint(equalToConstant: 78).isActive = true
        cosmosView.rating = 4
        cosmosView.filledColor = UIColor(red:1.00, green:0.82, blue:0.00, alpha:1.0)
        cosmosView.filledBorderColor = .clear
        cosmosView.emptyColor = UIColor(red:0.89, green:0.92, blue:0.95, alpha:1.0)
        cosmosView.starSize = 17
        cosmosView.emptyBorderColor = .clear
        cosmosView.starMargin = 1
        return cosmosView
    }()
    
    let itemPriceDollars:UILabel = {
        let price = UILabel()
        price.translatesAutoresizingMaskIntoConstraints = false
        price.text = "$92"
        price.font = UIFont.systemFont(ofSize: 24, weight: .medium)
        price.textColor = UIColor(red:0.29, green:0.29, blue:0.29, alpha:1.0)
        return price
    }()
    
    let itemPriceCents:UILabel = {
        let price = UILabel()
        price.translatesAutoresizingMaskIntoConstraints = false
        price.text = ".99"
        price.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        price.textColor = UIColor(red:0.29, green:0.29, blue:0.29, alpha:1.0)
        return price
    }()
    
    let addToCartBtn:UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("ADD TO CART", for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 9, weight: .bold)
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor(red:0.01, green:0.47, blue:1.00, alpha:1.00).cgColor
        btn.layer.cornerRadius = 35 / 2
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.heightAnchor.constraint(equalToConstant: 35).isActive = true
        btn.widthAnchor.constraint(equalToConstant: 84).isActive = true
        return btn
    }()
    
    let likeButton:FaveButton = {
        let btn = FaveButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20), faveIconNormal: UIImage(named: "heart"))
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.heightAnchor.constraint(equalToConstant: 20).isActive = true
        btn.widthAnchor.constraint(equalToConstant: 20).isActive = true
        return btn
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        constraints()
    }
    
    
    func constraints() {
        self.addSubview(shadowView)
        NSLayoutConstraint.activate([
            shadowView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            shadowView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            shadowView.widthAnchor.constraint(equalTo: self.widthAnchor),
            shadowView.heightAnchor.constraint(equalTo: self.heightAnchor)
            ])
        
        shadowView.addSubview(itemImage)
        NSLayoutConstraint.activate([
            itemImage.leadingAnchor.constraint(equalTo: shadowView.leadingAnchor, constant: 19),
            itemImage.centerYAnchor.constraint(equalTo: shadowView.centerYAnchor, constant: 0)
            ])
        
        shadowView.addSubview(itemTitle)
        NSLayoutConstraint.activate([
            itemTitle.leadingAnchor.constraint(equalTo: itemImage.trailingAnchor, constant: 21),
            itemTitle.topAnchor.constraint(equalTo: shadowView.topAnchor, constant: 17)
            ])
        
        shadowView.addSubview(itemManufacturer)
        NSLayoutConstraint.activate([
            itemManufacturer.leadingAnchor.constraint(equalTo: itemTitle.leadingAnchor, constant: 0),
            itemManufacturer.topAnchor.constraint(equalTo: itemTitle.bottomAnchor, constant: 6)
            ])
        
        shadowView.addSubview(itemRating)
        NSLayoutConstraint.activate([
            itemRating.topAnchor.constraint(equalTo: itemManufacturer.bottomAnchor, constant: 9),
            itemRating.leadingAnchor.constraint(equalTo: itemManufacturer.leadingAnchor, constant: 0)
            ])
        
        shadowView.addSubview(itemPriceDollars)
        NSLayoutConstraint.activate([
            itemPriceDollars.topAnchor.constraint(equalTo: itemRating.bottomAnchor, constant: 12),
            itemPriceDollars.leadingAnchor.constraint(equalTo: itemRating.leadingAnchor)
            ])
        
        shadowView.addSubview(itemPriceCents)
        NSLayoutConstraint.activate([
            itemPriceCents.topAnchor.constraint(equalTo: itemPriceDollars.topAnchor, constant: 4),
            itemPriceCents.leadingAnchor.constraint(equalTo: itemPriceDollars.trailingAnchor, constant: 0)
            ])
        
        shadowView.addSubview(addToCartBtn)
        NSLayoutConstraint.activate([
            addToCartBtn.trailingAnchor.constraint(equalTo: shadowView.trailingAnchor, constant: -14),
            addToCartBtn.bottomAnchor.constraint(equalTo: shadowView.bottomAnchor, constant: -15)
            ])
        
        likeButton.delegate = self
        shadowView.addSubview(likeButton)
        NSLayoutConstraint.activate([
            likeButton.trailingAnchor.constraint(equalTo: addToCartBtn.trailingAnchor, constant: 0),
            likeButton.topAnchor.constraint(equalTo: itemTitle.topAnchor, constant: 0)
            ])
    }
    
    @objc func likeAction() {
        likeButton.setSelected(selected: true, animated: true)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
