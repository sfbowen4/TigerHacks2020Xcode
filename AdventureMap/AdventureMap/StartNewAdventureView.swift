//
//  NewAdventureView.swift
//  AdventureMap
//
//  Created by Stephen Bowen on 11/7/20.
//

import SwiftUI

struct StartNewAdventureView: View {
    
    @State var userDefinedDistance : Float = 0.0
    @State var StartNewAdventure = true
    @State var showDistanceAlert = false
    
    func AdventureStart(){
        if userDefinedDistance == 0.0 {
            showDistanceAlert = true
        }
        else {
            StartNewAdventure = false
        }
    }
    
    var body: some View {
        
        if StartNewAdventure {
        
        VStack(alignment: .center) {
            Text("How far do you want to go?").font(.title3)
            Slider(value : $userDefinedDistance, in: 0...5, step: 0.25).padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
            Text("\(userDefinedDistance, specifier: "%.2f") miles").font(.largeTitle).padding(10)
            Button(action: {
                do {
                    sleep(1)
                }
                AdventureStart()
            }) {
                HStack {
                    Image(systemName: "figure.walk.circle.fill")
                        .font(.title)
                    Text("Start your adventure")
                        .fontWeight(.semibold)
                        .font(.title)
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(40)
            } .alert(isPresented: $showDistanceAlert){
                Alert(title: Text("Distance Error"), message: Text("Please select a distance other than zero."))
            }
            }
        }
        
        else {
            VStack(alignment: .center) {
                PickNewAdventureView(userDefinedDistance: userDefinedDistance)
            }
        }
    }
}

struct StartNewAdventureView_Previews: PreviewProvider {
    static var previews: some View {
        StartNewAdventureView()
    }
}
