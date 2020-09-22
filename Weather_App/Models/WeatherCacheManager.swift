//
//  WeatherCache.swift
//  Weather_App
//
//  Created by Theodora on 9/21/20.
//  Copyright © 2020 Feodora Andryieuskaya. All rights reserved.
//

import Foundation

struct WeatherCacheManager {
    
    static var weatherCache : [WeatherModel] = []
    static var daysOfTheWeekCache: [String] = []
    
    static func saveCache (data:[WeatherModel]) {
        weatherCache = data
        
        for item in data {
            let dayOfTheWeek = item.getFormatedDateFromTimestamp(format: "EEEE")
            if !daysOfTheWeekCache.contains(dayOfTheWeek) {
                daysOfTheWeekCache.append(dayOfTheWeek)
            }
        }
        
    }
    
    static func evictCache() {
        weatherCache = []
        daysOfTheWeekCache = []
    }
    
    static func getCache() -> [WeatherModel] {
        return weatherCache
    }


}
