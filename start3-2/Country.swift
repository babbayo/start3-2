//
//  Country.swift
//  start3-2
//
//  Created by MacBook on 12/11/2019.
//  Copyright © 2019 yaco. All rights reserved.
//

import Foundation

struct Country: Codable {
    let koreanName: String
    let assetName: String
    
    enum CodingKeys: String, CodingKey {
        case koreanName = "korean_name"
        case assetName = "asset_name"
    }
}
