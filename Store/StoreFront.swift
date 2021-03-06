//
//  ViewController.swift
//  Store
//
//  Created by Jonathan on 10/26/18.
//  Copyright © 2018 Jonathan. All rights reserved.
//

import UIKit

class StoreFront: UIViewController {
    
    let storeTitle:UILabel = {
        let title = UILabel()
        title.text = "Collections"
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = .systemFont(ofSize: 28, weight: .bold)
        title.textColor = UIColor(red:0.29, green:0.29, blue:0.29, alpha:1.0)
        return title
    }()
    
    let cartButton:UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(UIImage(named: "Cart")?.withRenderingMode(.alwaysOriginal), for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.heightAnchor.constraint(equalToConstant: 24).isActive = true
        btn.widthAnchor.constraint(equalToConstant: 23).isActive = true
        return btn
    }()
    
    let categoryButtons:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsHorizontalScrollIndicator = false
        return cv
    }()
    let categoryBtnID = "categoryBtnCollection"
    
    let categoryCollection:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = UIColor(red:0.96, green:0.97, blue:0.98, alpha:1.0)
        cv.isPagingEnabled = true
        return cv
    }()
    let categoryID = "categoryCollection"
    
    let selectedItem:UIView = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        
        return container
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red:0.96, green:0.97, blue:0.98, alpha:1.0)
        setupDelegates()
        setupUIElements()
        
    }
}




extension StoreFront {
    func setupUIElements() {
    
        view.addSubview(storeTitle)
        NSLayoutConstraint.activate([
            storeTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            storeTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30)
            ])
        view.addSubview(categoryButtons)
        NSLayoutConstraint.activate([
            categoryButtons.topAnchor.constraint(equalTo: storeTitle.bottomAnchor, constant: 16),
            categoryButtons.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            categoryButtons.heightAnchor.constraint(equalToConstant: 32),
            categoryButtons.widthAnchor.constraint(equalTo: view.widthAnchor, constant: 0)
            ])
        
        view.addSubview(categoryCollection)
        NSLayoutConstraint.activate([
            categoryCollection.topAnchor.constraint(equalTo: categoryButtons.bottomAnchor, constant: 19),
            categoryCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            categoryCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            categoryCollection.heightAnchor.constraint(equalTo: view.heightAnchor, constant: -170)
            ])
        
        view.addSubview(cartButton)
        NSLayoutConstraint.activate([
            cartButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            cartButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30)
            ])
    }
}

extension StoreFront {
    
    func setupDelegates() {
        // Category Btn Collection
        categoryButtons.delegate = self
        categoryButtons.dataSource = self
        categoryButtons.register(CategoryBtnCells.self, forCellWithReuseIdentifier: categoryBtnID)
        
        // Category Collection
        categoryCollection.delegate = self
        categoryCollection.dataSource = self
        categoryCollection.register(CategoryCells.self, forCellWithReuseIdentifier: categoryID)
    }
}


extension StoreFront:UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // Identify Collection
        switch collectionView {
        case categoryButtons:
            return Data.categories.count
        case categoryCollection:
            return 4
        default:
            return 4
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case categoryButtons:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: categoryBtnID, for: indexPath) as! CategoryBtnCells
            cell.categoryType.text = Data.categories[indexPath.item]
            cell.shadowView.backgroundColor = indexPath.item == 0 ? UIColor(red:0.04, green:0.55, blue:1.00, alpha:1.0) : .white
            cell.categoryType.textColor = indexPath.item == 0 ? .white : UIColor(red:0.04, green:0.55, blue:1.00, alpha:1.0)
            cell.active = indexPath.item == 0 ? true : false
            return cell
        case categoryCollection:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: categoryID, for: indexPath) as! CategoryCells
            cell.parentController = self
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case categoryButtons:
            let title = UILabel()
            title.text = Data.categories[indexPath.item]
            title.font = UIFont.systemFont(ofSize: 12, weight: .medium)
            return CGSize(width: title.intrinsicContentSize.width + 25, height: 31)
        case categoryCollection:
            return CGSize(width: categoryCollection.frame.width, height: categoryCollection.frame.height)
        default:
            return CGSize(width: 0, height: 0)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch collectionView {
        case categoryButtons:
            categoryCollection.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            categoryButtons.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            changeSelected(selected: indexPath.item)
        case categoryCollection:
            print(indexPath.row)
        default:
            print("Hello World")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        switch collectionView {
        case categoryButtons:
            return UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30)
        default:
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            
        }
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        // Active and Deactive Button on Category Change
        let x = targetContentOffset.pointee.x
        let target = Int(x / view.frame.width)
        let cells = categoryButtons.visibleCells as! [CategoryBtnCells]
        for (index,cell) in cells.enumerated() {
            if index == target {
                cells[index].shadowView.backgroundColor = UIColor(red:0.04, green:0.55, blue:1.00, alpha:1.0)
                cells[index].categoryType.textColor = .white
            } else {
                cell.shadowView.backgroundColor = .white
                cell.categoryType.textColor = UIColor(red:0.04, green:0.55, blue:1.00, alpha:1.0)
            }
        }
        categoryButtons.scrollToItem(at: IndexPath(item: target, section: 0), at: .centeredHorizontally, animated: true)
    }
    
    func changeSelected(selected:Int) {
        let cells = categoryButtons.visibleCells as! [CategoryBtnCells]
        for cellItem in cells {
            UIView.animate(withDuration: 0.3) {
                // Deactive
                cellItem.shadowView.backgroundColor = .white
                cellItem.categoryType.textColor = UIColor(red:0.04, green:0.55, blue:1.00, alpha:1.0)
                // Active
                cells[selected].shadowView.backgroundColor = UIColor(red:0.04, green:0.55, blue:1.00, alpha:1.0)
                cells[selected].categoryType.textColor = .white
            }
        }
        categoryButtons.scrollToItem(at: IndexPath(item: selected, section: 0), at: .centeredHorizontally, animated: true)
    }
    
}

extension StoreFront:CategoryItemCellDelegate {
    func openItem() {
        print("Do Things to main View Controller!")
    }
}
