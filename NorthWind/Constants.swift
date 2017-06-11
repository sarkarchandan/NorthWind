//
//  Constants.swift
//  NorthWind
//
//  Created by Chandan Sarkar on 11.06.17.
//  Copyright © 2017 Chandan. All rights reserved.
//

import Foundation

let BASE_URL = "http://api.openweathermap.org/data/2.5/"
let CURRENT = "weather?"
let FORECAST = "forecast/daily?"
let LATITUDE = "lat="
let LONGITUDE = "&lon="
let APP_ID = "&appid="
let FORECAST_COUNT = "&cnt=11"

//Put your API key here.
let API_KEY = "Your API Key Goes Here"

let CURRENT_WEATHER_URL = "\(BASE_URL)\(CURRENT)\(LATITUDE)\(Location.sharedLocation.latitude!)\(LONGITUDE)\(Location.sharedLocation.longitude!)\(APP_ID)\(API_KEY)"
let FORECAST_WEATHER_URL = "\(BASE_URL)\(FORECAST)\(LATITUDE)\(Location.sharedLocation.latitude!)\(LONGITUDE)\(Location.sharedLocation.longitude!)\(APP_ID)\(API_KEY)\(FORECAST_COUNT)"

typealias DownloadComplete = () -> ()
