//
//  Weather.swift
//  start3-2
//
//  Created by MacBook on 12/11/2019.
//  Copyright © 2019 yaco. All rights reserved.
//

import Foundation

//{
//   "city_name":"베를린",
//   "state":12,
//   "celsius":10.8,
//   "rainfall_probability":60
//}
struct Weather: Codable {
    let cityName: String
    let state: Int
    let celsius: Float
    let rainfallProbaility: Int
    
    var stateImage: String {
        switch state {
        case 10:
            return "sunny"
            case 11:
            return "snowy"
            case 12:
            return "cloudy"
            case 13:
            return "rainy"
        default:
            return ""
        }
    }
    
    var stateName: String {
        switch state {
        case 10:
            return "맑음"
            case 11:
            return "눈"
            case 12:
            return "흐림"
            case 13:
            return "비"
        default:
            return ""
        }
    }
    

    
    var description: String {
        return "섭씨 \(celsius) 도 / 화씨 \(celsius * 9 / 5 + 32) 도"
    }
    
    var description2: String {
        return "강수확률 \(rainfallProbaility) %"
    }
    
    enum CodingKeys: String, CodingKey {
        case state, celsius
        case cityName = "city_name"
        case rainfallProbaility = "rainfall_probability"
    }
    
    
}
