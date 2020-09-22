//
//  Cells.swift
//  Weather_App
//
//  Created by Theodora on 9/18/20.
//  Copyright © 2020 Feodora Andryieuskaya. All rights reserved.
//

import Foundation
import UIKit

class WeatherCell: UITableViewCell {
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var weatherDescriptionLabel: UILabel!
    @IBOutlet weak var temparatureLabel: UILabel!
}

class DayOfTheWeekCell: UITableViewCell {   
    @IBOutlet weak var dayLabel: UILabel!
}
