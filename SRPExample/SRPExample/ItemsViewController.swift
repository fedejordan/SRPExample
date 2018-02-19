//
//  ViewController.swift
//  SRPExample
//
//  Created by Federico Jordán on 19/2/18.
//  Copyright © 2018 Federico Jordán. All rights reserved.
//

import UIKit

class ItemsViewController: UIViewController {

    @IBOutlet private weak var itemsTableView: UITableView!
    private var items = [Item]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        items.append(Item(name: "Apple", image: UIImage(named: "apple")!))
        items.append(Item(name: "Banana", image: UIImage(named: "banana")!))
        items.append(Item(name: "Potato", image: UIImage(named: "potato")!))
        
        itemsTableView.register(UINib.init(nibName: ItemTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: ItemTableViewCell.identifier)
    }

}

// MARK:- UITableViewDataSource
extension ItemsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ItemTableViewCell.height
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ItemTableViewCell.identifier) as? ItemTableViewCell else { return UITableViewCell() }
        let item = items[indexPath.row]
        cell.setup(withItemImage: item.image, itemName: item.name)
        return cell
    }
}

// MARK:- UITableViewDelegate
extension ItemsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        print("Selected " + item.name + " at index: \(indexPath.row)")
    }
}

