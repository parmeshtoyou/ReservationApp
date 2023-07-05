//
//  LocationView.swift
//  ReservationApp
//
//  Created by Parmesh Mahore on 04/07/23.
//

import SwiftUI

struct LocationsView: View {
    
    @EnvironmentObject var model: Model
    
    var body: some View {
        VStack {
            NavigationView {
                List {
                    ForEach(model.restaurants) { (restaurant: Restaurant) in
                        NavigationLink(destination: ReservationForm(restaurant: restaurant, party: 1)) {
                            RestaurantView(restaurant: restaurant)
                        }
                        .navigationTitle("")
                        .navigationBarHidden(true)
                    }
                }
                .listStyle(.plain)
            }
        }
    }
}
