//
//  ProductsCollectionTableViewCell.swift
//  Shopify Summer 2019
//
//  Created by Bimal Bhagrath on 2019-01-18.
//  Copyright © 2019 Stack Companies Inc. All rights reserved.
//

import UIKit

class ProductsCollectionTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var collectionImage: UIImageView!
    @IBOutlet weak var bodyLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
