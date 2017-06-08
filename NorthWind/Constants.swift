//
//  Constants.swift
//  NorthWind
//
//  Created by Chandan Sarkar on 08.06.17.
//  Copyright © 2017 Chandan. All rights reserved.
//

import Foundation

let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let LATITUDE = "lat="
let LONGITUDE = "&lon="
let APP_ID = "&appid="
let API_KEY = "96111039d198b2a71f31fc133679307f"

let CURRENT_WEATHER_URL = "\(BASE_URL)\(LATITUDE)49.898814\(LONGITUDE)10.902764\(APP_ID)\(API_KEY)"

typealias DownloadComplete = () -> ()
