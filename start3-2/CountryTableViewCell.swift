//
//  CountryTableViewCell.swift
//  start3-2
//
//  Created by MacBook on 12/11/2019.
//  Copyright © 2019 yaco. All rights reserved.
//

import UIKit

class CountryTableViewCell: UITableViewCell {
    var countryIdx: Int!
    @IBOutlet var leftImage: UIImageView!
    @IBOutlet var rightLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
