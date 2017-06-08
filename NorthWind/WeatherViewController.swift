//
//  WeatherViewController.swift
//  NorthWind
//
//  Created by Chandan Sarkar on 07.06.17.
//  Copyright © 2017 Chandan. All rights reserved.
//

import UIKit
import Alamofire

class WeatherViewController: UIViewController, UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet weak var currentDateLabelOutlet: UILabel!
    @IBOutlet weak var currentDateTemperatureOutlet: UILabel!
    
    @IBOutlet weak var locationLabelOutlet: UILabel!
    
    @IBOutlet weak var currentWeatherConditionImageViewOutlet: UIImageView!
    
    @IBOutlet weak var currentWeatherConditionLabelOutlet: UILabel!
    
    @IBOutlet weak var weatherForecastTableViewOutlet: UITableView!
    
    var currentWeather: CurrentWeather!
    
    var weatherForecastArray = [WeatherForecast]()

    override func viewDidLoad() {
        super.viewDidLoad()
        weatherForecastTableViewOutlet.delegate = self
        weatherForecastTableViewOutlet.dataSource = self
        
        currentWeather = CurrentWeather()
        
        currentWeather.downloadCurrentWeatherDetails {
            self.updateWeatherCondition()
        }
        print(FORECAST_WEATHER_URL)
        
        self.downloadWeatherForecastData {
            //TODO
        }
    }
    
    //We pass on the no of items that we need to display
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherForecastArray.count
    }
    
    //We enquire from the UITableView whether there is reusable cell that we can use for displaying
    //new data
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let forecastCell = tableView.dequeueReusableCell(withIdentifier: "dailyForcastCell") as? WeatherForecastTableViewCell{
            let weatherForecastData = weatherForecastArray[indexPath.row]
            forecastCell.updateForecastData(weatherForecast: weatherForecastData)
            return forecastCell
        }else{
            return WeatherForecastTableViewCell()
        }
    }
    
    //Glues the View for Current Weather with the Model
    func updateWeatherCondition(){
        currentDateLabelOutlet.text = self.currentWeather.currentDate
        currentDateTemperatureOutlet.text = "\(self.currentWeather.currentTemperature)°"
        locationLabelOutlet.text = self.currentWeather.currentCityName
        currentWeatherConditionLabelOutlet.text = self.currentWeather.currentWeatherCondition
        //This is possible because our image assets are cleverly named to go well with weather states
        currentWeatherConditionImageViewOutlet.image = UIImage(named: self.currentWeather.currentWeatherCondition)
    }
    
    //Downloads the Forecast Weather data
    func downloadWeatherForecastData(completed: @escaping DownloadComplete){
        let weatherForecastUrl = URL(string: FORECAST_WEATHER_URL)!
        Alamofire.request(weatherForecastUrl).responseJSON { response in
            if let weatherForecastDictionary = response.result.value as? Dictionary<String,Any> {
                
                //Getting the array of forecast data for 10 days
                if let forecastArray = weatherForecastDictionary["list"] as? [Dictionary<String,Any>]{
                    //for each day
                    for eachDayForecast in forecastArray{
                        //For each day of forecast, instantiating the WeatherForecast with the
                        //Dictionary
                        let weatherForecast = WeatherForecast(weatherForcast: eachDayForecast)
                        //Then appending the new instance to the Array of WeatherForecast
                        self.weatherForecastArray.append(weatherForecast)
                    }
                    self.weatherForecastArray.remove(at: 0)
                    //Calling UiTableView to reload the data set
                    self.weatherForecastTableViewOutlet.reloadData()
                }
            }
            completed()
        }
    }
}

