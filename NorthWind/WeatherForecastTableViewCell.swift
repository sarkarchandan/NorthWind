//
//  WeatherForecastTableViewCell.swift
//  NorthWind
//
//  Created by Chandan Sarkar on 08.06.17.
//  Copyright © 2017 Chandan. All rights reserved.
//

import UIKit

class WeatherForecastTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var dayLabelOutlet: UILabel!
    @IBOutlet weak var weatherConditionLabelOutlet: UILabel!
    @IBOutlet weak var highTemperatureLabelOutlet: UILabel!
    @IBOutlet weak var lowTemperatureLabelOutlet: UILabel!
    @IBOutlet weak var weatherConditionImageOutlet: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateForecastData(weatherForecast: WeatherForecast){
        dayLabelOutlet.text = weatherForecast.forecastDay
        weatherConditionLabelOutlet.text = weatherForecast.forecastWeatherCondition
        highTemperatureLabelOutlet.text = weatherForecast.highTemperatureConstraint
        lowTemperatureLabelOutlet.text = weatherForecast.lowTemperatureConstraint
        weatherConditionImageOutlet.image = UIImage(named: weatherForecast.forecastWeatherCondition)
    }

}
