//
//  MainController.swift
//  Diabetes
//
//  Created by Lambert Lani on 4/28/24.
//

import SwiftUI

struct MainController: View {
    var body: some View {
        Image("ImageTree")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 300, height: 300)
        }
}


struct MainController_Previews: PreviewProvider {
    static var previews: some View {
        MainController()
    }
}
