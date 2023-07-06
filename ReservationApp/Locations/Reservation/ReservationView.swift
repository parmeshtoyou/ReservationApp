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
            if(model.reservations.isEmpty) {
                HStack {
                    Text("No Reservation Yet")
                        .padding(.top, 50)
                }
            } else {
                let reservation = model.reservations.first
                
                VStack(alignment: .leading) {
                    Text("RESTAURANT")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 15)
                    RestaurantView(restaurant: model.restaurants.first!).frame(alignment: .leading)
                        .padding(.bottom, 20)
                    
                    Divider().padding(.bottom, 20)
                    
                    HStack {
                        Text("NAME:").fontWeight(.medium).foregroundColor(.gray.opacity(0.7))
                        Text(reservation?.name ?? "").fontWeight(.regular)
                    }
                    HStack {
                        Text("E-MAIL:").fontWeight(.medium).foregroundColor(.gray.opacity(0.7))
                        Text(reservation?.email ?? "").fontWeight(.regular)
                    }
                    HStack {
                        Text("PHONE:").fontWeight(.medium).foregroundColor(.gray.opacity(0.7))
                        Text(reservation?.phone ?? "").fontWeight(.regular)
                    }
                    
                    
                    
                }.frame(maxWidth: .infinity).padding(20)
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
