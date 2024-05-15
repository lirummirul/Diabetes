//
//  StaticLeafView.swift
//  Diabetes
//
//  Created by Lambert Lani on 5/15/24.
//

import SwiftUI

struct StaticLeafShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX, y: rect.maxY))
        
        path.addEllipse(in: rect)
        
        return path
    }
}

struct StaticLeafView: View {
    var body: some View {
            StaticLeafShape()
                .fill(Color.green)
    }
}

struct StaticLeafView_Previews: PreviewProvider {
    static var previews: some View {
        StaticLeafView()
            .frame(width: 200, height: 150)
    }
}
