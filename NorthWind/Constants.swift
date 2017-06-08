//
//  Constants.swift
//  NorthWind
//
//  Created by Chandan Sarkar on 08.06.17.
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
let API_KEY = "96111039d198b2a71f31fc133679307f"

let CURRENT_WEATHER_URL = "\(BASE_URL)\(CURRENT)\(LATITUDE)49.898814\(LONGITUDE)10.902764\(APP_ID)\(API_KEY)"
let FORECAST_WEATHER_URL = "\(BASE_URL)\(FORECAST)\(LATITUDE)49.898814\(LONGITUDE)10.902764\(APP_ID)\(API_KEY)\(FORECAST_COUNT)"

typealias DownloadComplete = () -> ()
