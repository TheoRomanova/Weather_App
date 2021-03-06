//
//  WeatherModel.swift
//  Weather_App
//
//  Created by Theodora on 9/19/20.
//  Copyright © 2020 Feodora Andryieuskaya. All rights reserved.
//

import Foundation
import CoreLocation

struct WeatherModel: Equatable {
    let cityName: String
    let description: String
    let conditionID: Int
    let tempKelv: Double
    let humidity: Int
    let precipitation: Double
    let pressure: Int
    let speed: Double
    let deg: Int
    let dt: Double
    
        var conditionImage: String {
            switch conditionID {
            case 200...232:
                return "cloud.bolt.rain"
            case 300...321:
                return "cloud.drizzle"
            case 500...531:
                return "cloud.rain"
            case 600...622:
                return "cloud.snow"
            case 701...781:
                return "cloud.fog"
            case 800:
                return "sun.max"
            case 801...804:
                return "cloud.bolt"
            default:
                return "cloud"
            }
    }
    
    var temperatureCels: String {
        let cels = Int(tempKelv - 273.15)
        return String(cels)
    }
    
    var windSpeed: Int {
        return Int(speed)
    }
    
    var windDirection: String {
        let degrees = Double(deg)
        switch degrees {
        case 11.25...33.75:
            return "NNE"
        case 33.75...56.25:
            return "NE"
        case 56.25...78.75:
            return "ENE"
        case 78.75...101.25:
            return "E"
        case 101.25...123.75:
            return "ESE"
        case 123.75...146.25:
            return "SE"
        case 146.25...168.75:
            return "SSE"
        case 168.75...191.25:
            return "S"
        case 191.25...213.75:
            return "SSW"
        case 213.75...236.25:
            return "SW"
        case 236.25...258.75:
            return "WSW"
        case 258.75...281.25:
            return "W"
        case 281.25...303.75:
            return "WNW"
        case 303.75...326.25:
            return "NW"
        case 326.25...348.75:
            return "NNW"
        default:
            return "N"
        }
    }

    func getFormatedDateFromTimestamp(format: String) -> String {
        let date = Date(timeIntervalSince1970: dt)
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.medium
        dateFormatter.dateStyle = DateFormatter.Style.medium
        dateFormatter.timeZone = .current
        dateFormatter.timeZone = NSTimeZone() as TimeZone
        dateFormatter.dateFormat = format
        
        return dateFormatter.string(from: date)
    }
}
