//
//  CategoryCells.swift
//  Store
//
//  Created by Jonathan on 10/26/18.
//  Copyright © 2018 Jonathan. All rights reserved.
//

import UIKit

class CategoryCells: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .darkGray
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
