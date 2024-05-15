//
//  WelcomScreen.swift
//  Diabetes
//
//  Created by Lambert Lani on 4/28/24.
//

import SwiftUI

struct WelcomeScreen: View {
    var body: some View {
        VStack {
               Image("ImageTree")
                   .resizable()
                   .aspectRatio(contentMode: .fit)
                   .frame(width: 300, height: 300)
               Text("   Следите за дабетом вместе с трекером привычек 'aboaboa'")
               Text("   Настройте в приложении время, в которое бы вы хотели измерять сахар и не забывайте указывать результат в приложении")
               Text("   Дерево будет указывать вам, как часто вы забываете о себе : следите за ним, как и за своим здоровьем")
    //                       .font(.largeTitle)
               }
        }
}


struct WelcomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeScreen()
    }
}
