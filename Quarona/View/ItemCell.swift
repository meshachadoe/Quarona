//
//  ItemCell.swift
//  Quarona
//
//  Created by Meshach Adoe on 07/09/20.
//  Copyright © 2020 Meshach Adoe. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {

    @IBOutlet weak var itemBox: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        itemBox.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
