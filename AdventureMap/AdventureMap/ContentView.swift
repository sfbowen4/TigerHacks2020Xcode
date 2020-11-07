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
    
    var CurrentViewTitle = "Adventure Map"
    @State private var isShowingProfile = false
    @State private var isShowingStartNewAdventure = false
    
    var body: some View {
        
        NavigationView {
        VStack {
            GoogleMapsView()
        }
        .edgesIgnoringSafeArea(.top)
        .edgesIgnoringSafeArea(.bottom)
        .navigationBarTitle(CurrentViewTitle, displayMode: .inline)
        .navigationBarItems(leading:
                    Button(action: {
                        isShowingProfile = false
                        isShowingStartNewAdventure = !(isShowingStartNewAdventure)
                    }) {
                        if isShowingStartNewAdventure
                        { Image(systemName: "x.circle.fill").imageScale(.large) }
                        else
                        { Image(systemName: "plus.circle.fill").imageScale(.large) }
                    },
                trailing:
                    Button(action: {
                        isShowingStartNewAdventure = false
                        isShowingProfile = !(isShowingProfile)
                    }) {
                        Image("JerryProfile").imageScale(.small)
                    })
        }
            if isShowingStartNewAdventure
            {
                GeometryReader { metrics in
                StartNewAdventureView().edgesIgnoringSafeArea(.top)
                                  .edgesIgnoringSafeArea(.bottom)
                    .frame(height: metrics.size.height * 0.80)
                }
            }
        
            if isShowingProfile
            {
                GeometryReader { metrics in
                ProfileView().edgesIgnoringSafeArea(.top)
                             .edgesIgnoringSafeArea(.bottom)
                    .frame(height: metrics.size.height * 0.80)
                }
            }
            
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
