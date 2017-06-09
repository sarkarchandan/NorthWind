//
//  WeatherForecast.swift
//  NorthWind
//
//  Created by Chandan Sarkar on 08.06.17.
//  Copyright © 2017 Chandan. All rights reserved.
//

import UIKit
import Alamofire

class WeatherForecast{
    
    private var _forecastDay: String!
    private var _forecastWeatherCondition: String!
    private var _highTemperature: String!
    private var _lowTemperature: String!
    
    var forecastDay: String{
        get{
            if _forecastDay == nil{
                _forecastDay = ""
            }
            return _forecastDay
        }
        set{
            _forecastDay = newValue
        }
    }
    
    var forecastWeatherCondition: String{
        get{
            if _forecastWeatherCondition == nil{
                _forecastWeatherCondition = ""
            }
            return _forecastWeatherCondition
        }
        set{
            _forecastWeatherCondition = newValue
        }
    }
    
    var highTemperatureConstraint: String{
        get{
            if _highTemperature == nil{
                _highTemperature = ""
            }
            return _highTemperature
        }
        set{
            _highTemperature = newValue
        }
    }
    
    var lowTemperatureConstraint: String{
        get{
            if _lowTemperature == nil{
                _lowTemperature = ""
            }
            return _lowTemperature
        }
        set{
            _lowTemperature = newValue
        }
    }
    
    init(weatherForcast: Dictionary<String,Any>){
        
        //Getting the Day
        if let day = weatherForcast["dt"] as? Double{
            
            let unixConvertedDate = Date(timeIntervalSince1970: day)
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .full
            dateFormatter.dateFormat = "EEEE"
            dateFormatter.timeStyle = .none
            forecastDay = unixConvertedDate.dayOfTheWeek()
        }
        
        //Getting the Max and Min temperature
        if let temperatureDictionary = weatherForcast["temp"] as? Dictionary<String,Any>{
            
            //Getting High temperature
            if let highTemperature = temperatureDictionary["max"] as? Double{
                
//                let kelvinToFarenheitPreDivisionForHigh = (highTemperature * (9/5) - 459.67)
//                let kelvinToFarenheitForHigh = Double(round(10 * kelvinToFarenheitPreDivisionForHigh/10))
                highTemperatureConstraint = "\((highTemperature - 273).roundTo(places: 1))°"
            }
            
            //Getting Low temperature
            if let lowTemperature = temperatureDictionary["min"] as? Double {

//                let kelvinToFarenheitPreDivisionForLow = (lowTemperature * (9/5) - 459.67)
//                let kelvinToFarenheitForLow = Double(round(10 * kelvinToFarenheitPreDivisionForLow/10))
                lowTemperatureConstraint = "\((lowTemperature - 273).roundTo(places: 1))°"
            }
            
            //Getting Weather condition
            if let weatherConditionArray = weatherForcast["weather"] as? [Dictionary<String,Any>]{
                
                let weatherConditionDictionary = weatherConditionArray[0]
                
                if let weatherCondition = weatherConditionDictionary["main"] as? String{
                    forecastWeatherCondition = weatherCondition
                }
            }
        }
    }
}

extension Date {
    func dayOfTheWeek() -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
}
