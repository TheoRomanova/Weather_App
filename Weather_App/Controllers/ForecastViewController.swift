//
//  ForecastViewController.swift
//  Weather_App
//
//  Created by Theodora on 9/18/20.
//  Copyright © 2020 Feodora Andryieuskaya. All rights reserved.
//

import UIKit
import CoreLocation

class ForecastViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                print(WeatherCacheManager.daysOfTheWeekCache)
                print(WeatherCacheManager.daysOfTheWeekCache)
                print(WeatherCacheManager.daysOfTheWeekCache)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        tableView.rowHeight = 80
    }
}

//MARK: - UITableViewDelegate, UITableViewDataSource

extension ForecastViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return WeatherCacheManager.getCache().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let weatherData = WeatherCacheManager.getCache()
        let weatherItem = weatherData[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as! WeatherCell
        
        cell.weatherImage.image = UIImage(systemName: weatherItem.conditionImage)
        cell.weatherDescriptionLabel.text = weatherItem.description
        cell.temparatureLabel.text = weatherItem.temperatureCels + "°"
        cell.timeLabel.text = weatherItem.getFormatedDateFromTimestamp(format: "HH:mm")
        
        return cell
    }
}

