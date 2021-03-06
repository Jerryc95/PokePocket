//
//  LocationView.swift
//  PokePocket
//
//  Created by Jerry Cox on 5/12/22.
//

import SwiftUI

struct LocationView: View {
    @EnvironmentObject var network: Network
    
    var body: some View {
        VStack {
            if network.locations.isEmpty {
                Text("There are no known locations to find this Pokemon")
                    .frame(width: 150)
                    .multilineTextAlignment(.center)
                    .font(.callout)
                    .foregroundColor(.secondary)
                    .padding(.bottom, 5)
            } else {
                Divider()
                ForEach(network.locations, id: \.self) { location in
                    Text(location.locationArea.name.removeDash(location.locationArea.name).capitalizingFirstLetter())
                    Divider()
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .padding()
        
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
    }
}
