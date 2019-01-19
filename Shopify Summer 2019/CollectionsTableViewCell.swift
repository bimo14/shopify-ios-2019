//
//  CollectionsTableViewCell.swift
//  Shopify Summer 2019
//
//  Created by Bimal Bhagrath on 2019-01-18.
//  Copyright © 2019 Stack Companies Inc. All rights reserved.
//

import UIKit

class CollectionsTableViewCell: UITableViewCell {

    @IBOutlet weak var view: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        view.shape()
    }
    
    // MARK: - Table View Cell

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
