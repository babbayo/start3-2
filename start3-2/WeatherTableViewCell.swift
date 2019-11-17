//
//  WeatherTableViewCell.swift
//  start3-2
//
//  Created by MacBook on 12/11/2019.
//  Copyright © 2019 yaco. All rights reserved.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {

    var weatherIdx: Int!
    @IBOutlet var leftImage: UIImageView!
    @IBOutlet var firstLabel: UILabel!
    @IBOutlet var secondLabel: UILabel!
    @IBOutlet var thirdLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
