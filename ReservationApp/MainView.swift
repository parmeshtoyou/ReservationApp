//
//  MainView.swift
//  ReservationApp
//
//  Created by Parmesh Mahore on 04/07/23.
//

import SwiftUI

struct MainView: View {
    @StateObject var model = Model()
    
    var body: some View {
        VStack {
            LittleLemonLogo()
                .padding(.top, 50)
            
            Text(model.displayingReservationForm ? "Reservation Details" : "Select a location")
                .padding([.leading, .trailing], 40)
                .padding([.top, .bottom], 8)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(20)
            
            //internally TabView will take care of updating this selected index
            TabView(selection: $model.tabViewSelectedIndex) {
                LocationsView()
                    .tag(0)
                    .tabItem {
                        // by default the value of this form is false
                        // this will take care of setting tabs on home page
                        if !model.displayingReservationForm {
                            Label("Locations", systemImage: "fork.knife")
                        }
                    }
                ReservationView()
                    .tag(1)
                    .tabItem {
                        // by default the value of this form is false
                        // this will take care of setting tabs on home page
                        if !model.displayingReservationForm {
                            Label("Reservation", systemImage: "square.and.pencil")
                        }
                    }
            }
            .environmentObject(model)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
