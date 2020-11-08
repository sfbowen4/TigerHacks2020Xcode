//
//  ProfileView.swift
//  AdventureMap
//
//  Created by Stephen Bowen on 11/7/20.
//

//Track points, UserName, Name, recent adventures, total adventures

import SwiftUI

struct ProfileView: View {
    var body: some View {
        Image("JerryFace").offset(y : -180)
        VStack(alignment: .center){
            Text("Jerry Bot").bold().font(.title).padding(1)
            Text("JerryBot707").italic().font(.title3).padding(1)
            HStack()
            {
                Text("Adventure Points:").bold()
                Text("157")
            }.padding(1)
            .frame(alignment: .center)
            HStack()
            {
                Text("Total Adventures:").bold()
                Text("7")
            }
        }.offset(y : 10)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
