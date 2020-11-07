//
//  PickNewAdventureView.swift
//  AdventureMap
//
//  Created by Stephen Bowen on 11/7/20.
//

import SwiftUI

struct PickNewAdventureView: View {
    
    let userDefinedDistance: Double?
    
    var body: some View {
        Text("\(userDefinedDistance!, specifier: "%.2f")")
    }
}

struct PickNewAdventureView_Previews: PreviewProvider {
    static var previews: some View {
        PickNewAdventureView(userDefinedDistance: 10.0)
    }
}
