//
//  ItemCell.swift
//  Quarona
//
//  Created by Meshach Adoe on 07/09/20.
//  Copyright © 2020 Meshach Adoe. All rights reserved.
//

import UIKit

class ExpenseCell: UITableViewCell {

    @IBOutlet weak var itemBox: UIView!
    @IBOutlet weak var expenseName: UILabel!
    @IBOutlet weak var expenseValue: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        itemBox.layer.cornerRadius = 10
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
