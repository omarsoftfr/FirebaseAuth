//
//  TabCtrl.swift
//  FirebaseAuthentification
//
//  Created by Sébastien Filaumart on 10/01/2020.
//  Copyright © 2020 Sébastien Filaumart. All rights reserved.
//

import SwiftUI

struct TabCtrl: View {
    
    @State private var selection = 0
          var body: some View {
            TabView(selection: $selection){
                VStack{
                    Home()
                }.tabItem({
                    Image(systemName: Constants.TabBarImageName.tabBar0)
                    Text(LocalizedStringKey(Constants.TabBarText.tabBar0))
                }).tag(0)
                VStack{
                    ContentViewMap()
                    //Map()
                }.tabItem({
                    Image(systemName: Constants.TabBarImageName.tabBar1)
                    Text(LocalizedStringKey(Constants.TabBarText.tabBar1))
                }).tag(1)
                VStack{
                    Profil()
                }.tabItem({
                    Image(systemName: Constants.TabBarImageName.tabBar2)
                    Text(LocalizedStringKey(Constants.TabBarText.tabBar2))
                }).tag(2)
            }
          }
}

struct TabCtrl_Previews: PreviewProvider {
    static var previews: some View {
        TabCtrl()
    }
}
