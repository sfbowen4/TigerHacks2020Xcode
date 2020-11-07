//
//  GoogleMapsView.swift
//  AdventureMap
//
//  Created by Stephen Bowen on 11/6/20.
//
// Completed Map showing current user location

import SwiftUI
import GooglePlaces
import GoogleMaps

struct GoogleMapsView: UIViewRepresentable {
    
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
    
    private let zoom: Float = 15.0
    func makeUIView(context: Self.Context) -> GMSMapView {
        findLocation()
        let camera = GMSCameraPosition.camera(withLatitude: locationManager.location!.coordinate.latitude, longitude: locationManager.location!.coordinate.longitude, zoom: 6.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        let userLocationMarker = GMSMarker(position: locationManager.location!.coordinate)
        userLocationMarker.icon = UIImage(named: "Jerry")
        userLocationMarker.map = mapView
        return mapView
    }
    
    func updateUIView(_ mapView: GMSMapView, context: Context) {
        findLocation()
    }
}
