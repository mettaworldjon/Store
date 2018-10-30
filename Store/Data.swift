//
//  Data.swift
//  Store
//
//  Created by Jonathan on 10/26/18.
//  Copyright © 2018 Jonathan. All rights reserved.
//

import Foundation

struct Data {
    static var categories = ["Living Room", "Kitchen & Dining", "Office", "Bed"]
    static var item = [
        Item(itemTitle: "Wood White", itemPrice: 52.99, itemRating: 4, itemManufacturer: "Collection 2018", itemImage: "woodwhite"),
        Item(itemTitle: "Dinning Chair", itemPrice: 92.99, itemRating: 3, itemManufacturer: "Collection 2018", itemImage: "dinningchair"),
        Item(itemTitle: "Foam Chair", itemPrice: 58.99, itemRating: 4, itemManufacturer: "Collection 2017", itemImage: "foamchair"),
        Item(itemTitle: "Black Chair", itemPrice: 96.99, itemRating: 3, itemManufacturer: "Collection 2018", itemImage: "blackchair")
    ]
}

struct Item {
    var itemTitle:String
    var itemPrice:Double
    var itemRating:Int
    var itemManufacturer:String
    var itemImage:String
}
