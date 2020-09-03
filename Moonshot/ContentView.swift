//
//  ContentView.swift
//  Moonshot
//
//  Created by Adrian B. Haeske on 26.08.20.
//  Copyright © 2020 adrianhaeske. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    var body: some View {
        NavigationView {
            List(missions) { mission in
                NavigationLink(destination: MissionView(mission: mission, astronauts: astronauts, missions: missions)) {
                    HStack {
                        Image(mission.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50)
                        VStack(alignment: .leading) {
                            Text(mission.displayName)
                                .font(.headline)
                            Text(mission.formattedLaunchDate)
                        }
                    }
                }
            }
            .navigationBarTitle("Moon Missions")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
