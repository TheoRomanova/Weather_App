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
        weatherCache = data
    }
    
    static func evictCache() {
        weatherCache = []
    }
    
    static func getCache() -> [WeatherModel] {
        return weatherCache
    }
}
