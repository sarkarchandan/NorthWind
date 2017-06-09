//
//  Location.swift
//  NorthWind
//
//  Created by Chandan Sarkar on 09.06.17.
//  Copyright © 2017 Chandan. All rights reserved.
//

import CoreLocation

class  Location {
    static var sharedLocation = Location()
    private init() {}
    
    //We only need to latitude and longitude
    //When CLLocation pulls the location of the device, 
    //it pulls CLLocationDegree which has the datatype Double.
    
    var latitude: Double!
    var longitude: Double!
}
