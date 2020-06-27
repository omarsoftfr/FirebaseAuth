//
//  SwiftUIView.swift
//  FirebaseAuthentification
//
//  Created by Sébastien Filaumart on 26/06/2020.
//  Copyright © 2020 Sébastien Filaumart. All rights reserved.
//

import SwiftUI

struct SwiftUIView: View {
    @State private var selection = 0
       
          var body: some View {
              TabView(selection: $selection){
                  Text("First View")
                      .font(.title)
                      .tabItem {
                          VStack {
                              Image("first")
                              Text("First")
                          }
                      }
                      .tag(0)
                  Text("Second View")
                      .font(.title)
                      .tabItem {
                          VStack {
                              Image("second")
                              Text("Second")
                          }
                      }
                      .tag(1)
              }
          }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
