//
//  RestaurantView.swift
//  ReservationApp
//
//  Created by Parmesh Mahore on 05/07/23.
//

import SwiftUI

struct RestaurantView: View {
    var restaurant: Restaurant
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(restaurant.city)
                .font(.headline)
                .foregroundColor(.black.opacity(0.7))
            Text("\(restaurant.neighborhood) - \(restaurant.phoneNumber)")
                .font(.subheadline)
                .font(.custom("", size: 20))
                .foregroundColor(.black.opacity(0.5))
        }
    }
}

struct RestaurantView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantView(restaurant: Restaurant(
            id: UUID(),
            city: "Bangalore",
            neighborhood: "Whitefield",
            phoneNumber: "1234567890"
            )
        )
    }
}
