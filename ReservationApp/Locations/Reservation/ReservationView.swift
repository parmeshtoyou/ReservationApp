//
//  ReservationView.swift
//  ReservationApp
//
//  Created by Parmesh Mahore on 05/07/23.
//

import SwiftUI

struct ReservationView: View {
    @EnvironmentObject var model: Model
    
    var body: some View {
        Text(model.reservations.isEmpty ? "No Reservation Yet" : "\(model.reservations.count) Reservation Available")
        if(!model.reservations.isEmpty) {
            let reservation = model.reservations.first
            
            VStack {
                Text("RESTAURANT")
                Text(reservation?.restaurant.city ?? "")
                Text("\(reservation?.restaurant.neighborhood ?? "") - \(reservation?.restaurant.phoneNumber ?? "")")
                
            }
        }
    }
}

struct ReservationView_Previews: PreviewProvider {
    static var previews: some View {
        ReservationView()
    }
}
