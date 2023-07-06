//
//  Model.swift
//  ReservationApp
//
//  Created by Parmesh Mahore on 04/07/23.
//

import Foundation
import SwiftUI


@MainActor class Model: ObservableObject {
    @Published var displayingReservationForm: Bool = false
    @Published var title: String = "Select a location"
    @Published var restaurantsList: [Restaurant]
    var reservations: [Reservation]
    
    init() {
        restaurantsList = [
            Restaurant(id: UUID(), city: "Las Vegas", neighborhood: "Downtown", phoneNumber: "(702) 555-9898"),
            Restaurant(id: UUID(), city: "Los Angeles", neighborhood: "North Hollywood", phoneNumber: "(702) 555-1453"),
            Restaurant(id: UUID(), city: "Los Angeles", neighborhood: "Venice", phoneNumber: "(310) 555-1222"),
            Restaurant(id: UUID(), city: "Nevada", neighborhood: "Venice", phoneNumber: "(725) 555-5454"),
            Restaurant(id: UUID(), city: "San Francisco", neighborhood: "North Beach", phoneNumber: "(415) 555-1345"),
            Restaurant(id: UUID(), city: "San Francisco", neighborhood: "Union Square", phoneNumber: "(415) 555-9813")
        ]
        //initialise with empty list
        reservations = []
    }
    
    @Published var restaurants = [
        Restaurant(id: UUID(), city: "Las Vegas", neighborhood: "Downtown", phoneNumber: "(702) 555-9898"),
        Restaurant(id: UUID(), city: "Los Angeles", neighborhood: "North Hollywood", phoneNumber: "(702) 555-1453"),
        Restaurant(id: UUID(), city: "Los Angeles", neighborhood: "Venice", phoneNumber: "(310) 555-1222"),
        Restaurant(id: UUID(), city: "Nevada", neighborhood: "Venice", phoneNumber: "(725) 555-5454"),
        Restaurant(id: UUID(), city: "San Francisco", neighborhood: "North Beach", phoneNumber: "(415) 555-1345"),
        Restaurant(id: UUID(), city: "San Francisco", neighborhood: "Union Square", phoneNumber: "(415) 555-9813")
    ]
}

class Restaurant: Identifiable, Codable {
    var id: UUID
    var city : String
    var neighborhood: String
    var phoneNumber: String
    
    init(id: UUID, city: String, neighborhood: String, phoneNumber: String) {
        self.id = id
        self.city = city
        self.neighborhood = neighborhood
        self.phoneNumber = phoneNumber
    }
}

class Reservation: Identifiable {
    var id: UUID
    var restaurant: Restaurant
    var party: Int
    var dateAndTime: Date
    var name: String
    var phone: String
    var email: String
    var specialRequest: String
    
    init(id: UUID,
         restaurant: Restaurant,
         party: Int,
         dateAndTime: Date,
         name: String,
         phone: String,
         email: String,
         specialRequest: String) {
        
        self.id = id
        self.restaurant = restaurant
        self.party = party
        self.dateAndTime = dateAndTime
        self.name = name
        self.phone = phone
        self.email = email
        self.specialRequest = specialRequest
    }
}
