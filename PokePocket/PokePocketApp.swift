//
//  PokePocketApp.swift
//  PokePocket
//
//  Created by Jerry Cox on 5/12/22.
//

import SwiftUI

@main
struct PokePocketApp: App {
    var network = Network(details: Details.example, results: Results.example, speciesDetail: SpeciesDetail.example, evolution: Evolution.example, locations: Locations.example)
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(network)
        }
    }
}
