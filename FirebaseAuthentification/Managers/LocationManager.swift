//
//  LocationManager.swift
//  FirebaseAuthentification
//
//  Created by Sébastien Filaumart on 27/06/2020.
//  Copyright © 2020 Sébastien Filaumart. All rights reserved.
//

import Foundation
import MapKit

class LocationManager: NSObject {
    private let locationManager = CLLocationManager()
    @Published var location:CLLocation? = nil
    
    override init(){
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.distanceFilter = kCLDistanceFilterNone
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }
}

extension LocationManager: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {
            return
        }
        self.location = location
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print("locationManager - didChangeAuthorization:  \(status)")
    }
    
}
