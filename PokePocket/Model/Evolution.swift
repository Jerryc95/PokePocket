//
//  Evolution.swift
//  PokePocket
//
//  Created by Jerry Cox on 5/12/22.
//

import Foundation

struct Evolution: Decodable, Hashable {
    let chain: Chain
    
   static let example = Evolution(chain: Chain(evolvesTo: [], species: Species(name: "", url: "")))
}

struct Chain: Decodable, Hashable {
    let evolvesTo: [Chain]
    let species: Species
}

struct EvolutionDetail: Decodable, Hashable {
    let trigger: Species

}
