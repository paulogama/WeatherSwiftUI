//
//  Weather.swift
//  WeatherSwiftUI
//
//  Created by Paulo Gama on 07/11/19.
//  Copyright © 2019 GamaPaulo. All rights reserved.
//

import Foundation

struct WeatherResponse: Decodable {
    let main: Weather
}

struct Weather: Decodable {
    var temp: Double?
    var humidity: Double?
}
