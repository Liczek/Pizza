//
//  ItemsTableViewCell.swift
//  Pizza v2
//
//  Created by Pawel on 28.07.2016.
//  Copyright © 2016 LiczekCompany. All rights reserved.
//

import UIKit

class ItemsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var itemDescriptionLabel: UILabel!
    @IBOutlet weak var normalItemLabel: UILabel!
    @IBOutlet weak var largeItemLabel: UILabel!
    @IBOutlet weak var forItemsLabel: UILabel!
    @IBOutlet weak var toPayLabel: UILabel!
    
    @IBOutlet weak var normalTextField: UITextField!
    @IBOutlet weak var largeTextField: UITextField!
    
    
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
