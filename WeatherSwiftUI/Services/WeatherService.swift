//
//  WeatherService.swift
//  WeatherSwiftUI
//
//  Created by Paulo Gama on 07/11/19.
//  Copyright © 2019 GamaPaulo. All rights reserved.
//

import Foundation

class WeatherService {
    func getWeather(city: String, completion: @escaping (Weather?) -> ()) {
        guard let url = URL(string: "https://samples.openweathermap.org/data/2.5/weather?q=\(city)&appid=b6907d289e10d714a6e88b30761fae22") else {
            completion(nil)
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return }

            let weatherResponse = try? JSONDecoder().decode(WeatherResponse.self, from: data)

            if let weatherResponse = weatherResponse {
                let weather = weatherResponse.main
                completion(weather)
            } else {
                completion(nil)
            }
        }.resume()
    }
}
