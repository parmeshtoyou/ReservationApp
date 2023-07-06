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
        VStack(alignment: .leading) {
            Text(model.reservations.isEmpty ? "No Reservation Yet" : "\(model.reservations.count) Reservation Available")
            List {
                ForEach(model.reservations) { reservation in
                    Text(reservation.name)
                }
            }
            Spacer()
        }.onAppear {
            model.title = "RESERVATION"
        }
    }
}

struct ReservationView_Previews: PreviewProvider {
    static var previews: some View {
        ReservationView()
    }
}
