//
//  PlaceList.swift
//  FirebaseAuthentification
//
//  Created by Sébastien Filaumart on 27/06/2020.
//  Copyright © 2020 Sébastien Filaumart. All rights reserved.
//

import SwiftUI
import MapKit

struct PlaceList: View {
    
    let landmarks: [Landmark]
    var onTap: () -> ()
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                EmptyView()
            }.frame(width: UIScreen.main.bounds.size.width, height: 60)
            .background(Color.white)
            .gesture(TapGesture()
                .onEnded(self.onTap)
            )
            
            List{
                ForEach(self.landmarks, id: \.id) { landmark in
                    VStack(alignment: .leading){
                        Text(landmark.name)
                            .fontWeight(.bold)
                        Text(landmark.title)
                    }
                }
            }.animation(nil)
            
        }.cornerRadius(10)
    }
}

struct PlaceList_Previews: PreviewProvider {
    static var previews: some View {
        PlaceList(landmarks: [Landmark(placemark: MKPlacemark())], onTap: {})
    }
}
