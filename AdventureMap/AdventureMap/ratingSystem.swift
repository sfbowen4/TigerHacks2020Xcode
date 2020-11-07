//
//  ratingSystem.swift
//  AdventureMap
//
//  Created by AJ Wilkinson on 11/6/20.
//

import Foundation
//Import "Locatoin Star Rating
//Import "Current Location"
//Import "Location Distance"

class ratingSystem{
    
    
    var distance:Float = locationDistance - currentDistance
    var rating:Float
    
    switch distance{
    
    case (distance <= 5.0):
        rating = starRating * 2
    
    case (distance > 5.0 && distance <= 10.0):
        rating = starRating
    
    default:
        rating = starRating * 0.5
    
    }
    
    
    
    
    
}

