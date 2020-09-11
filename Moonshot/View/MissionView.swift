//
//  MissionDetail.swift
//  Moonshot
//
//  Created by Adrian B. Haeske on 01.09.20.
//  Copyright © 2020 adrianhaeske. All rights reserved.
//

import SwiftUI

struct MissionView: View {
    let mission: Mission
    let astronauts: [CrewMember]
    let missions: [Mission]
    
    var body: some View {
      
            GeometryReader { geo in
                ScrollView(.vertical) {
                    VStack {
                        Image(self.mission.imageName)
                            .resizable()
                            .scaledToFit()
                            .padding(.top)
                            .frame(width: geo.size.width*0.35)
                        
                        Text(self.mission.formattedLaunchDate)
                        
                        Spacer(minLength: 25)
                        
                        ForEach(self.astronauts, id: \.role) { crewMember in
                            NavigationLink(destination: AstronautView(astronaut: crewMember.astronaut, missions: missions)) {
                                HStack {
                                    Image(crewMember.astronaut.id)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: geo.size.width*0.3)
                                        .clipShape(Circle())
                                    VStack(alignment: .leading) {
                                        Text(crewMember.astronaut.name)
                                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                        Text(crewMember.role)
                                    }
                                    
                                    Spacer()
                                }
                                .padding(.horizontal)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                        
                        
                        Text(self.mission.description)
                            .padding()
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .navigationBarTitle(self.mission.displayName)
        }
        
        
    
    
    init(mission: Mission, astronauts: [Astronaut], missions: [Mission]) {
        self.mission = mission
        self.missions = missions
        
        var matchedAstronauts = [CrewMember]()
        
        for member in mission.crew {
            if let match = astronauts.first(where: { $0.id == member.name }) {
                matchedAstronauts.append(CrewMember(role: member.role, astronaut: match))
            } else {
                fatalError("Missing member \(member.name)")
            }
        }
        
        self.astronauts = matchedAstronauts
    }
    
    struct CrewMember {
        let role: String
        let astronaut: Astronaut
    }
}

struct MissionDetail_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        NavigationView {
            MissionView(mission: Self.missions[2], astronauts: Self.astronauts, missions: missions)
                .navigationBarHidden(true)
        }
    }
}
