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
    
    static func saveCache (data:[WeatherModel]) {
        evictCache()
        for (index, element) in data.enumerated() {
            if (index == 0 || element.getFormatedDateFromTimestamp(format: Constantst.timeFormat) == Constantst.zeroTime) {
                weatherCache.append(element)
            }
            weatherCache.append(element)
        }
    }
    
    static func evictCache() {
        weatherCache = []
    }
    
    static func getCache() -> [WeatherModel] {
        return weatherCache
    }
}
