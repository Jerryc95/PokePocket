//
//  ContentView.swift
//  PokePocket
//
//  Created by Jerry Cox on 5/12/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var network: Network
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            List {
                ForEach(searchResults, id: \.self) { pokemon in
                    NavigationLink(destination: PokemonDetailView(result: pokemon)) {
                        HStack {
                            Image("\(pokemon.url.urlIndex(url: pokemon.url))")
                            Text((pokemon.name.fixSuffix(pokemon.name).capitalizingFirstLetter()))
                        }
                    }
                }
            }
            .environment(\.defaultMinListRowHeight, 65)
            .listStyle(InsetListStyle())
            .navigationTitle("PokePocket")
            .searchable(text: $searchText, prompt: "Search a Pokémon")
            .disableAutocorrection(true)
            
            
        }
        .onAppear {
            // network.fetchPokemon()
            network.fetchResults()
        }
    }
        
    var searchResults: [Result] {
        let allResults = network.results.results
        if searchText.isEmpty {
            return allResults
        } else {
            return allResults.filter { $0.name.contains(searchText.lowercased()) }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
