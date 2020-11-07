//
//  grabingSortingPOI.swift
//  AdventureMap
//
//  Created by AJ Wilkinson on 11/7/20.
//

import Foundation
//import POI
var poiDict = [String:Int]

/*
for poi in selectedPOI{
    poiDict[selectedPOIhash] = selectedPOIhash.rating
}
 */

let sortedByValueDictionary = poiDict.sorted{return $0.1 > $1.1}
