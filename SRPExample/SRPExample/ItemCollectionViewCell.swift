//
//  ItemCollectionViewCell.swift
//  SRPExample
//
//  Created by Federico Jordán on 19/2/18.
//  Copyright © 2018 Federico Jordán. All rights reserved.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {

    static let identifier: String = "ItemCollectionViewCell"
    static let width: CGFloat = 100.0
    static let height: CGFloat = 135.0
    
    @IBOutlet private weak var itemImageView: UIImageView!
    @IBOutlet private weak var itemLabel: UILabel!
    
}

extension ItemCollectionViewCell {
    func setup(withItemImage itemImage: UIImage, itemName: String) {
        itemImageView.image = itemImage
        itemLabel.text = itemName
    }
}
