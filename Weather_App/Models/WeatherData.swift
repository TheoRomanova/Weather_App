//
//  Model.swift
//  Weather_App
//
//  Created by Theodora on 9/18/20.
//  Copyright © 2020 Feodora Andryieuskaya. All rights reserved.
//

import Foundation

struct WeatherData: Decodable {
    let list: [WeatherInfo]
    let city: CityInfo
}

struct WeatherInfo: Decodable {
    let main: WeatherParametres
    let weather: [Weather]
    let pop: Double
    let wind: WindInfo
    let dt: Double
}

struct WindInfo: Decodable {
    let speed: Double
    let deg: Int
}

struct Weather: Decodable {
    let description: String
    let id: Int
}

struct WeatherParametres: Decodable {
    let pressure: Int
    let temp: Double
    let humidity: Int
}

struct CityInfo: Decodable {
    let name: String
}
