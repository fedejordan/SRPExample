//
//  ItemsInteractor.swift
//  SRPExample
//
//  Created by Federico Jordán on 19/2/18.
//  Copyright © 2018 Federico Jordán. All rights reserved.
//

import UIKit

class ItemsInteractor {

    private var items = [Item]()
    
    func loadData() {
        items.append(Item(name: "Apple", image: UIImage(named: "apple")!))
        items.append(Item(name: "Banana", image: UIImage(named: "banana")!))
        items.append(Item(name: "Potato", image: UIImage(named: "potato")!))
    }
    
    func itemsCount() -> Int {
        return items.count
    }
    
    func itemImage(atIndex index: Int) -> UIImage {
        return items[index].image
    }
    
    func itemName(atIndex index: Int) -> String {
        return items[index].name
    }
    
    func didSelectItem(atIndex index: Int) {
        let item = items[index]
        print("Selected " + item.name + " at index: \(index)")
    }
    
}
