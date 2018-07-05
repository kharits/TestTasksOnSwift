//
//  SKPrototypeTableViewCell.swift
//  65AppsTasks
//
//  Created by Sergey Kharitonov on 03.07.2018.
//  Copyright © 2018 Sergey Kharitonov. All rights reserved.
//

import UIKit

let kPrototypeTableViewCellIdentifier = "PrototypeCell"


class SKPrototypeTableViewCell: UITableViewCell {

    @IBOutlet weak var prototypeImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
