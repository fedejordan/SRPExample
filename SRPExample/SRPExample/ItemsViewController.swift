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
    private var itemsInteractor = ItemsInteractor()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        itemsInteractor.loadData()
        
        itemsTableView.register(UINib.init(nibName: ItemTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: ItemTableViewCell.identifier)
    }

}

// MARK:- UITableViewDataSource
extension ItemsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ItemTableViewCell.height
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsInteractor.itemsCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ItemTableViewCell.identifier) as? ItemTableViewCell else { return UITableViewCell() }
        let itemImage = itemsInteractor.itemImage(atIndex: indexPath.row)
        let itemName = itemsInteractor.itemName(atIndex: indexPath.row)
        cell.setup(withItemImage: itemImage, itemName: itemName)
        return cell
    }
}

// MARK:- UITableViewDelegate
extension ItemsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        itemsInteractor.didSelectItem(atIndex: indexPath.row)
    }
}

