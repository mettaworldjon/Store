//
//  CategoryCells.swift
//  Store
//
//  Created by Jonathan on 10/26/18.
//  Copyright © 2018 Jonathan. All rights reserved.
//

import UIKit

class CategoryCells: UICollectionViewCell {
    
    let collectionItems:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 25
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = UIColor(red:0.96, green:0.97, blue:0.98, alpha:1.0)
        return cv
    }()
    let cvID = "itemID"
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCollection()
        setupUI()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        self.addSubview(collectionItems)
        NSLayoutConstraint.activate([
            collectionItems.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            collectionItems.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            collectionItems.heightAnchor.constraint(equalTo: self.heightAnchor),
            collectionItems.widthAnchor.constraint(equalTo: self.widthAnchor)
            ])
    }
    
}


extension CategoryCells: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Data.item.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionItems.dequeueReusableCell(withReuseIdentifier: cvID, for: indexPath) as! CategoryItemCell
        cell.itemTitle.text = Data.item[indexPath.item].itemTitle
        cell.itemImage.image = UIImage(named: "\(Data.item[indexPath.item].itemImage)")
        cell.itemManufacturer.text = Data.item[indexPath.item].itemManufacturer
        cell.itemRating.rating = Double(Data.item[indexPath.item].itemRating)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.width - 60, height: 140)
    }
    
    func setupCollection() {
        collectionItems.delegate = self
        collectionItems.dataSource = self
        collectionItems.register(CategoryItemCell.self, forCellWithReuseIdentifier: cvID)
    }
}
