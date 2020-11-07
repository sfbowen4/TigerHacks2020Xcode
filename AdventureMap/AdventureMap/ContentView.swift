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
    var body: some View {
        VStack {
            GoogleMapsView()
                .edgesIgnoringSafeArea(.top)
                .frame(height: 800)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
