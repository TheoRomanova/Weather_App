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
        self.tableView.delegate = self
        self.tableView.dataSource = self
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
        let previousItem = indexPath.row > 0 ? weatherData[indexPath.row - 1] : nil
        let weatherDate = weatherItem.getFormatedDateFromTimestamp(format: Constantst.timeFormat)
        
        let dayOfTheWeekCell = tableView.dequeueReusableCell(withIdentifier: Constantst.dayOfTheWeekCell, for: indexPath) as! DayOfTheWeekCell
        let weatherCell = tableView.dequeueReusableCell(withIdentifier: Constantst.weatherCell, for: indexPath) as! WeatherCell
        
        if indexPath.row == 0 {
            tableView.rowHeight = 40
            dayOfTheWeekCell.dayLabel.text = "Today"
            
            return dayOfTheWeekCell
            
        } else if weatherDate == Constantst.zeroTime && weatherItem != previousItem {
            tableView.rowHeight = 40
            dayOfTheWeekCell.dayLabel.text = weatherItem.getFormatedDateFromTimestamp(format: Constantst.dayOfTheWeek)
            return dayOfTheWeekCell
       
        } else  {
      
            tableView.rowHeight = 80
            weatherCell.weatherImage.image = UIImage(systemName: weatherItem.conditionImage)
            weatherCell.weatherDescriptionLabel.text = weatherItem.description
            weatherCell.temparatureLabel.text = weatherItem.temperatureCels + "°"
            weatherCell.timeLabel.text = weatherDate
            
            return weatherCell
        }        
    }
}
