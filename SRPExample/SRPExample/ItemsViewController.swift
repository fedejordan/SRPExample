//
//  ViewController.swift
//  SRPExample
//
//  Created by Federico Jordán on 19/2/18.
//  Copyright © 2018 Federico Jordán. All rights reserved.
//

import UIKit

class ItemsViewController: UIViewController {

    @IBOutlet private weak var itemsCollectionView: UICollectionView!
    private var itemsInteractor = ItemsInteractor()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        itemsInteractor.loadData()
        
        itemsCollectionView.register(UINib.init(nibName: ItemCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: ItemCollectionViewCell.identifier)
    }

}

// MARK:- UICollectionViewDataSource
extension ItemsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemsInteractor.itemsCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemCollectionViewCell.identifier, for: indexPath) as? ItemCollectionViewCell else { return UICollectionViewCell() }
        let itemImage = itemsInteractor.itemImage(atIndex: indexPath.row)
        let itemName = itemsInteractor.itemName(atIndex: indexPath.row)
        cell.setup(withItemImage: itemImage, itemName: itemName)
        return cell
    }
    
}

// MARK:- UICollectionViewDelegateFlowLayout
extension ItemsViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellSize = CGSize(width: ItemCollectionViewCell.width, height: ItemCollectionViewCell.height)
        return cellSize
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        itemsInteractor.didSelectItem(atIndex: indexPath.row)
    }
    
}
