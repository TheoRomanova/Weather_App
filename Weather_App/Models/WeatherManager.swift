//
//  WeatherManager.swift
//  Weather_App
//
//  Created by Theodora on 9/19/20.
//  Copyright © 2020 Feodora Andryieuskaya. All rights reserved.
//

import Foundation
import CoreLocation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: [WeatherModel])
    
    func didFailWithError(error: Error)
}

struct WeatherManager {
    let weatherURL: String = "https://api.openweathermap.org/data/2.5/forecast?q=minsk&appid=2e3e8b9f5b5ca32fffaedad64b0180b8"
    var delegate: WeatherManagerDelegate?
    
    func fetchWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        let urlString = "\(weatherURL)&lat=\(latitude)&lon=\(longitude)"
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            let session =  URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data {
                    if let weather = self.parseJSON(safeData) {
                        WeatherCacheManager.saveCache(data: weather)
                        self.delegate?.didUpdateWeather(self, weather: weather)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ weatherData: Data) -> [WeatherModel]? {
        let decoder = JSONDecoder() 
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            
            let city = decodedData.city.name
            var arrayOfData = [WeatherModel]()
            
            for item in decodedData.list {
                
                let weather =  WeatherModel(
                    cityName: city,
                    description: item.weather[0].description,
                    conditionID: item.weather[0].id,
                    tempKelv: item.main.temp,
                    humidity: item.main.humidity,
                    precipitation: item.pop,
                    pressure: item.main.pressure,
                    speed: item.wind.speed,
                    deg: item.wind.deg,
                    dt: item.dt
                )
                arrayOfData.append(weather)
            }
            
            return arrayOfData
            
        } catch {
            delegate?.didFailWithError(error: error)
        }
        return nil
    }
}
