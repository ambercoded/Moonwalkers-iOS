//
//  AstronautView.swift
//  Moonshot
//
//  Created by Adrian B. Haeske on 02.09.20.
//  Copyright © 2020 adrianhaeske. All rights reserved.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    let missions: [Mission]
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                VStack {
                    Image(astronaut.id)
                        .resizable()
                        .scaledToFit()
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .padding()

                    Text("Missions")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    
                    ForEach(missions) { mission in
                        Text(mission.displayName)
                    }
                            
                    
                    Text(astronaut.description)
                        .padding()
                }
            }
            .navigationBarTitle(astronaut.name)
        }
    }
    
    init(astronaut: Astronaut, missions: [Mission]) {
        self.astronaut = astronaut
        
        var participatedMissions = [Mission]()
        
        for mission in missions {
            for member in mission.crew {
                if astronaut.id == member.name {
                    participatedMissions.append(mission)
                    print("...........................there is a fit! \(astronaut.id) == \(member.name). Thus, he took part in mission \(mission)!!!! resulting array of mathec stuff: \(participatedMissions)")
                } else {
                    print("------------------------ \(astronaut.id) == \(member.name)? NONE FOUND-------------------")
                }
            }
        }
        
        self.missions = participatedMissions
        
    }
}

struct AstronautView_Previews: PreviewProvider {
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    
    static var previews: some View {
        NavigationView {
            AstronautView(astronaut: astronauts[6], missions: missions)
        }
    }
}
