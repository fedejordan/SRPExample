//
//  ItemTableViewCell.swift
//  SRPExample
//
//  Created by Federico Jordán on 19/2/18.
//  Copyright © 2018 Federico Jordán. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    static let identifier: String = "ItemTableViewCell"
    static let height: CGFloat = 80.0
    
    @IBOutlet private weak var itemImageView: UIImageView!
    @IBOutlet private weak var itemLabel: UILabel!
    
}

extension ItemTableViewCell {
    func setup(withItemImage itemImage: UIImage, itemName: String) {
        itemImageView.image = itemImage
        itemLabel.text = itemName
    }
}
