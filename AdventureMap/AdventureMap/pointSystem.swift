//
//  pointSystem.swift
//  AdventureMap
//
//  Created by AJ Wilkinson on 11/6/20.
//

import Foundation

class pointSystem {
    
    var points:Int = 200
    var newPoints:Int = 0
    
    func locationReach()->Int{
        
        let result = 10
        return result
        
    }

    func finalLocationReach(newPoints:Int) -> Int{
        
        let result = Int(Double(newPoints)*1.5)
        
        return result
    }

    func endOfAdventure(arg1 points:Int, arg2 newPoints:Int) -> Int{
        
        let result = points + newPoints
        
        return result
    }
    
}
