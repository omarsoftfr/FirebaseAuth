//
//  tabCtrl.swift
//  
//
//  Created by Sébastien Filaumart on 26/06/2020.
//

import SwiftUI

struct tabCtrl: View {
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

struct tabCtrl_Previews: PreviewProvider {
    static var previews: some View {
        tabCtrl()
    }
}
