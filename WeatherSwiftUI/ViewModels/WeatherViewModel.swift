//
//  WeatherViewModel.swift
//  WeatherSwiftUI
//
//  Created by Paulo Gama on 07/11/19.
//  Copyright © 2019 GamaPaulo. All rights reserved.
//

import Foundation
import Combine

class WeatherViewModel: ObservableObject {
    private var weatherService: WeatherService
    @Published var weather = Weather()
    var cityName = ""

    var temperature: String {
        if let temp = weather.temp {
            return String(format: "%.0f", temp)
        } else {
            return ""
        }
    }

    var humidity: String {
        if let humidity = weather.humidity {
            return String(format: "%.0f", humidity)
        } else {
            return ""
        }
    }

    init() {
        self.weatherService = WeatherService()
    }

    func search() {
        if let city = cityName.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
            fetchWeather(by: city)
        }
    }

    private func fetchWeather(by city: String) {
        weatherService.getWeather(city: city) { weather in
            if let weather = weather {
                DispatchQueue.main.async {
                    self.weather = weather
                }
            }
        }
    }
}
