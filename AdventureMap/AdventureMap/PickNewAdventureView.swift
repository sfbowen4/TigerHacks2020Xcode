//
//  PickNewAdventureView.swift
//  AdventureMap
//
//  Created by Stephen Bowen on 11/7/20.
//

import SwiftUI
import CoreLocation
import GooglePlaces
import GoogleMaps

struct CheckBoxView: View {
    
    @Binding var checked: Bool
    @Binding var trimVal: CGFloat
    @Binding var width: CGFloat
    @Binding var removeText : Bool
    
    var animatableData: CGFloat{
        get {trimVal}
        set {trimVal = newValue}
    }
    
    
    var body: some View{
        ZStack{
            Capsule()
                .trim(from: 0, to: trimVal)
                .stroke(style: StrokeStyle(lineWidth: 2))
                .frame(width: width, height: 40)
                .foregroundColor(self.checked ? Color.blue : Color.blue)
                .overlay(
                    Capsule()
                        .fill(self.checked ? Color.blue : Color.blue)
                        .frame(width: width , height: 40))
            
            if checked {
                Image(systemName: "checkmark")
                    .foregroundColor(Color.white).opacity(Double(trimVal))
            }
            if !removeText {
                Text("Go!").foregroundColor(Color.white)
            }
        }
    }
}

struct PickNewAdventureView: View {
    
    struct POIRow: View {
        
        let locationManager = CLLocationManager()
        
        func findLocation()
        {
            locationManager.requestAlwaysAuthorization()
            locationManager.requestWhenInUseAuthorization()
            if CLLocationManager.locationServicesEnabled() {
                locationManager.desiredAccuracy = kCLLocationAccuracyBest
                locationManager.startUpdatingLocation()
            }
        }
        //Navigate away from app
        func navigateToGoogleMapsApp(destLat: Double, destLon: Double){
            let directionsRequest = "https://www.google.com/maps/@\(locationManager.location!.coordinate.latitude),\(locationManager.location!.coordinate.longitude),15z" +
            "?saddr=\(locationManager.location!.coordinate.latitude)%20\(locationManager.location!.coordinate.longitude)" +
              "&daddr=\(destLat)%20\(destLon)" +
          "&directionsmode=walking"

            let directionsURL = URL(string: directionsRequest)!
            UIApplication.shared.openURL(directionsURL)
        }
        
        
        
        let locationName: String?
        let locationDistance: Double?
        let locationLat: Double?
        let locationLong: Double?
        
        @State var trimVal : CGFloat = 0
        @State var checked = false
        @State var removeText = false
        @State var width : CGFloat = 60

        var body: some View{
            HStack(){
                CheckBoxView(checked: $checked, trimVal: $trimVal, width : $width, removeText: $removeText)
                    .onTapGesture{
                        if !self.checked {
                            self.removeText = true
                            withAnimation {
                                self.width = width - 20
                            }
                        }
                    if !self.checked {
                        withAnimation(Animation.easeIn(duration: 0.4)) {
                            self.trimVal = 1
                            self.checked = true
                            navigateToGoogleMapsApp(destLat: locationLat!, destLon: locationLong!)
                        }
                    } else {
                        }
                    }
                Text(locationName!).frame(alignment: .leading)
                Spacer()
                Text("\(locationDistance!, specifier: "%.2f") miles").frame(alignment: .trailing)
            }
            }
        }
    
    let locationManager = CLLocationManager()
    let userDefinedDistance: Float?
    
    func findLocation()
    {
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
    }
    
    var body: some View {
        
        List() {
            POIRow(locationName : "Harpos", locationDistance: 0.7, locationLat: 38.950649, locationLong: -92.326820)
            POIRow(locationName : "Columbia Art League", locationDistance: 0.6, locationLat: 38.9491017, locationLong: -92.327748)
            POIRow(locationName : "Hot Box Cookies", locationDistance: 0.7, locationLat: 38.951716, locationLong: -92.325952)
            POIRow(locationName : "Rose Music Hall", locationDistance: 2.5, locationLat: 38.9508926, locationLong: -92.3351828)
            POIRow(locationName : "Vibez", locationDistance: 1.1, locationLat: 38.9525238, locationLong: -92.3262277)
            POIRow(locationName: "Sake Japanese Bistro and Bar", locationDistance: 0.7, locationLat: 38.9508926, locationLong: -92.3262277)
            POIRow(locationName: "Campus Bar & Grill", locationDistance: 0.6, locationLat: 38.9483242, locationLong: -92.32747739999999)
            POIRow(locationName: "Arris' Pizza", locationDistance: 3.7, locationLat: 38.91030569999999, locationLong: -92.32807489999999)
            POIRow(locationName: "Addison's", locationDistance: 0.8, locationLat: 38.95064499999999, locationLong: -92.32924199999999)
            POIRow(locationName: "44 Canteen", locationDistance: 0.9, locationLat: 38.9522999, locationLong: -92.3278438)
        }.offset(y: -5)
        .edgesIgnoringSafeArea(.bottom)
        .frame(height: 520, alignment: .trailing)
    }
}
