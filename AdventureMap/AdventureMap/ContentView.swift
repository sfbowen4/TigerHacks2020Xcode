//
//  ContentView.swift
//  AdventureMap
//
//  Created by Stephen Bowen on 11/6/20.
//

import SwiftUI
import GoogleMaps
import GooglePlaces
import CoreLocation

struct ContentView: View {
    
    @State private var isShowingProfile = false
    @State private var isShowingNewAdventure = false
    var CurrentViewTitle = "Adventure Map"
    
    var body: some View {
        
        NavigationView {
        VStack {
            GoogleMapsView()
        }.frame(height: 1000)
        .edgesIgnoringSafeArea(.top)
        .navigationBarTitle(CurrentViewTitle, displayMode: .inline)
        .navigationBarItems(leading:
                    Button(action: {
                        isShowingProfile = false
                        isShowingNewAdventure = !(isShowingNewAdventure)
                    }) {
                        if isShowingNewAdventure
                        { Image(systemName: "x.circle.fill").imageScale(.large) }
                        else
                        { Image(systemName: "plus.circle.fill").imageScale(.large) }
                    },
                trailing:
                    Button(action: {
                        isShowingNewAdventure = false
                        isShowingProfile = !(isShowingProfile)
                    }) {
                        Image("JerryProfile").imageScale(.small)
                    })
        }
            if isShowingNewAdventure
            {
                NewAdventureView().frame(width: 200, height: 600)
            }
        
            if isShowingProfile
            {
                ProfileView().frame(width: 200, height: 600)
            }
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
