//
//  Map.swift
//  FirebaseAuthentification
//
//  Created by Sébastien Filaumart on 27/06/2020.
//  Copyright © 2020 Sébastien Filaumart. All rights reserved.
//

import SwiftUI
import MapKit

struct Map:View {
    
    private var locationManager = LocationManager()
    
    @State private var landmarks: [Landmark] = [Landmark]()
    
    var body: some View{
        MapView(landmarks: landmarks)
    }
}

struct Map_Previews: PreviewProvider {
    static var previews: some View {
        Map()
    }
}
