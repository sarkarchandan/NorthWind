//
//  CurrentWeather.swift
//  NorthWind
//
//  Created by Chandan Sarkar on 08.06.17.
//  Copyright © 2017 Chandan. All rights reserved.
//

import UIKit
import Alamofire

class CurrentWeather{
    
    var _currentCityName: String!
    var _currentDate: String!
    var _currentWeatherCondition: String!
    var _currentTemperature: Double!
    
    var currentCityName: String {
        get{
            if _currentCityName == nil{
                return ""
            }else{
                return _currentCityName
            }
        }
        set{
            _currentCityName = newValue
        }
    }
    
    var currentDate: String{
        get{
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            dateFormatter.timeStyle = .short
            let date = dateFormatter.string(from: Date())
            self._currentDate = "Today \(date)"
            return _currentDate
        }
    }
    
    var currentWeatherCondition: String{
        get{
            if _currentWeatherCondition == nil{
                return ""
            }else{
                return _currentWeatherCondition
            }
        }
        set{
            _currentWeatherCondition = newValue
        }
    }
    
    var currentTemperature: Double{
        get{
            if _currentTemperature == nil{
                return 0.0
            }else{
                return _currentTemperature
            }
        }
        set{
            _currentTemperature = newValue
        }
    }
    
    func downloadCurrentWeatherDetails(completed: @escaping DownloadComplete){
        let currentWeatherUrl = URL(string: CURRENT_WEATHER_URL)!
        Alamofire.request(currentWeatherUrl).responseJSON { response in
            
            let result = response.result
            //Starting to parse the JSON response
            
            //Optional casting the result as a Disctionary
            if let weatherDataDictionary = result.value as? Dictionary<String,Any>{
                //Optional and extracting the city name from the Dictionary with the key name
                if let cityName = weatherDataDictionary["name"] as? String{
                    
                    //Calling the setter
                    self.currentCityName = cityName
                }
                //Optional content for the key weather as an array of Dictionaries
                if let cityWeatherCondition = weatherDataDictionary["weather"] as? [Dictionary<String,Any>] {
                    
                    //Array has only one element which is again a Dictionary
                    let weatherDescriptionArray = cityWeatherCondition[0]
                    
                    //Optional casting content for the key description as a String
                    if let weatherDescription = weatherDescriptionArray["main"] as? String{
                        
                        //Calling the setter
                        self.currentWeatherCondition = weatherDescription
                    }
                }
                //Optional casting content for the key main. This is outer main separate from the
                //one we used before.
                if let coreWeatherProperties = weatherDataDictionary["main"] as? Dictionary<String,Any>{
                    //Optional casting contet with the key temp inside the content for the key main
                    if let currentTemperature = coreWeatherProperties["temp"] as? Double{
                        let kelvinToFarenheitPreDivision = (currentTemperature * (9/5) - 459.67)
                        let kelvinToFarenheit = Double(round(10 * kelvinToFarenheitPreDivision/10))
                        
                        //Calling the setter
                        self.currentTemperature = kelvinToFarenheit
                    }
                }
            }
            completed()
        }
    }
}
