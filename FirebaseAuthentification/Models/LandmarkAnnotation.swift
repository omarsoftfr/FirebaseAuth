//
//  LandmarkAnnotation.swift
//  FirebaseAuthentification
//
//  Created by Sébastien Filaumart on 27/06/2020.
//  Copyright © 2020 Sébastien Filaumart. All rights reserved.
//

import MapKit
import UIKit

final class LandmarkAnnotation: NSObject, MKAnnotation{
    let title: String?
    let coordinate: CLLocationCoordinate2D
    
    init(landmark: Landmark) {
        self.title = landmark.name
        self.coordinate = landmark.coordinate
    }
}
