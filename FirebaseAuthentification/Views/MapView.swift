//
//  MapView.swift
//  FirebaseAuthentification
//
//  Created by Sébastien Filaumart on 27/06/2020.
//  Copyright © 2020 Sébastien Filaumart. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    
    let landmarks: [Landmark]
    
    func makeUIView(context: Context) -> MKMapView {
        let map = MKMapView()
        map.showsUserLocation = true;
        map.delegate = context.coordinator
        return map
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MapView>) {
        updateAnnotations(form: uiView)
    }
    
    private func updateAnnotations(form mapView:MKMapView){
        mapView.removeAnnotations(mapView.annotations)
        let annotations = self.landmarks.map(LandmarkAnnotation.init)
        mapView.addAnnotations(annotations)
    }
    
}

struct  ContentViewMap: View {
    
    private var locationManager = LocationManager()
    @State private var search: String = ""
    @State private var landmarks: [Landmark] = [Landmark]()
    @State private var tapped: Bool = false
    
    private func getNearByLandmarks(){
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = search
        
        let search = MKLocalSearch(request: request)
        search.start{(response, error) in
            if let response = response {
                
                let mapItems = response.mapItems
                self.landmarks = mapItems.map{
                    Landmark(placemark: $0.placemark)
                }
                
            }
        }
    }
    
    
    func calculateOffset() -> CGFloat {
        if self.landmarks.count > 0 && !self.tapped{
            return UIScreen.main.bounds.size.height - UIScreen.main.bounds.size.height/4
        }
        else if self.tapped {
            return 100
        }else {
            return UIScreen.main.bounds.size.height
        }
    }
    
    
    var body: some View{
        ZStack(alignment: .top) {
            MapView(landmarks: landmarks)
            TextField("SEARCH", text: $search, onEditingChanged: {
                _  in }){
                    self.getNearByLandmarks()
            }.textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .offset(y: 44)
            
            PlaceList(landmarks: self.landmarks){
                // on tap
                self.tapped.toggle()
                
            }.animation(.spring())
            .offset(y: calculateOffset())
        }
        
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewMap()
    }
}
