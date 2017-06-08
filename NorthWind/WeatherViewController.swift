//
//  WeatherViewController.swift
//  NorthWind
//
//  Created by Chandan Sarkar on 07.06.17.
//  Copyright © 2017 Chandan. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet weak var currentDateLabelOutlet: UILabel!
    @IBOutlet weak var currentDateTemperatureOutlet: UILabel!
    
    @IBOutlet weak var locationLabelOutlet: UILabel!
    
    @IBOutlet weak var currentWeatherConditionImageViewOutlet: UIImageView!
    
    @IBOutlet weak var currentWeatherConditionLabelOutlet: UILabel!
    
    @IBOutlet weak var weatherForecastTableViewOutlet: UITableView!
    
    var currentWeather: CurrentWeather!

    override func viewDidLoad() {
        super.viewDidLoad()
        weatherForecastTableViewOutlet.delegate = self
        weatherForecastTableViewOutlet.dataSource = self
        
        currentWeather = CurrentWeather()
        
        currentWeather.downloadCurrentWeatherDetails {
            self.updateWeatherCondition()
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dailyForcastCell",for: indexPath)
        return cell
    }
    
    func updateWeatherCondition(){
        currentDateLabelOutlet.text = self.currentWeather.currentDate
        currentDateTemperatureOutlet.text = "\(self.currentWeather.currentTemperature)"
        locationLabelOutlet.text = self.currentWeather.currentCityName
        currentWeatherConditionLabelOutlet.text = self.currentWeather.currentWeatherCondition
        //This is possible because our image assets are cleverly named to go well with weather states
        currentWeatherConditionImageViewOutlet.image = UIImage(named: self.currentWeather.currentWeatherCondition)
    }


}

