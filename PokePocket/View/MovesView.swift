//
//  MovesView.swift
//  PokePocket
//
//  Created by Jerry Cox on 5/12/22.
//

import SwiftUI

struct MovesView: View {
    @EnvironmentObject var network: Network
    
    var body: some View {
        VStack {
            Divider()
            ForEach(network.details.moves, id: \.self) { move in
                Text(move.move.name.removeDash(move.move.name).capitalizingFirstLetter())
                Divider()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding()
    }
}

struct MovesView_Previews: PreviewProvider {
    static var previews: some View {
        MovesView()
    }
}
