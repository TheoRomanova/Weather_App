//
//  ViewController.swift
//  Weather_App
//
//  Created by Theodora on 9/18/20.
//  Copyright © 2020 Feodora Andryieuskaya. All rights reserved.
//

import UIKit
import CoreLocation

class TodayViewController: UIViewController {
    
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var weatherDescriptionLabel: UILabel!
    
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var precipitationLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    @IBOutlet weak var windDirectionLabel: UILabel!
    
    var weatherManager = WeatherManager()
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        
        weatherManager.delegate = self
    }
    
    @IBAction func shareButtonPressed(_ sender: UIButton) {
        let alert = UIAlertController(
            title: "Share weather forecast",
            message: "Do want to share today's weather data?", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true)
    }
}

//MARK: - WeatherManagerDelegate

extension TodayViewController: WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: [WeatherModel]) {
        DispatchQueue.main.async {
            self.weatherImage.image = UIImage(systemName: weather[0].conditionImage)
            self.cityLabel.text = weather[0].cityName
            self.temperatureLabel.text = weather[0].temperatureCels + "°С"
            self.weatherDescriptionLabel.text = weather[0].description
            self.humidityLabel.text = String(weather[0].humidity) + "%"
            self.precipitationLabel.text = String(weather[0].precipitation) + "%"
            self.pressureLabel.text = String(weather[0].pressure) + " hPa"
            self.windSpeedLabel.text = String(weather[0].windSpeed) + " km/h"
            self.windDirectionLabel.text = weather[0].windDirection
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}

//MARK: - CLLocationManagerDelegate

extension TodayViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            locationManager.stopUpdatingLocation()
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            weatherManager.fetchWeather(latitude: lat, longitude: lon)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Can't find current location")
    }
}
