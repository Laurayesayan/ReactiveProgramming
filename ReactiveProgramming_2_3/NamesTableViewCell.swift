//
//  NamesTableViewCell.swift
//  ReactiveProgramming_2_3
//
//  Created by Лаура Есаян on 16.02.2020.
//  Copyright © 2020 LY. All rights reserved.
//

import UIKit

class NamesTableViewCell: UITableViewCell {

    @IBOutlet weak var namesLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
