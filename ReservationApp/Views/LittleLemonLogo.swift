//
//  LittleLemonLogo.swift
//  ReservationApp
//
//  Created by Parmesh Mahore on 03/07/23.
//

import SwiftUI

struct LittleLemonLogo: View {
    var body: some View {
        Image("littleLemon")
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}

struct LittleLemonLogo_Previews: PreviewProvider {
    static var previews: some View {
        LittleLemonLogo()
    }
}
