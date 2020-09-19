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
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
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
                        self.delegate?.didUpdateWeather(self, weather: weather)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder() 
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData) //expect dataType
            
            let city = decodedData.city.name
            let description = decodedData.list[0].weather[0].description
            let condition = decodedData.list[3].weather[0].id //image
            let temp = decodedData.list[0].main.temp
            let humidity = decodedData.list[0].main.humidity
            let precipitation = decodedData.list[0].pop
            let pressure = decodedData.list[0].main.pressure
            let speed = decodedData.list[0].wind.speed
            let direction = decodedData.list[0].wind.deg
            let time = decodedData.list[2].dt
            
            let weather =  WeatherModel(cityName: city, description: description, conditionID: condition, tempKelv: temp, humidity: humidity, precipitation: precipitation, pressure: pressure, speed: speed, deg: direction, dt: time)
            return weather
        } catch {
            delegate?.didFailWithError(error: error)
        }
        return nil
    }
    
}
