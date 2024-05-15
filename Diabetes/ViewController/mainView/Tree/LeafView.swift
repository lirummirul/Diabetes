//
//  LeafView.swift
//  Diabetes
//
//  Created by Lambert Lani on 5/15/24.
//

import SwiftUI

struct LeafShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.minX, y: rect.midY))
        path.addCurve(to: CGPoint(x: rect.midX, y: rect.minY), control1: CGPoint(x: rect.minX + rect.width / 4, y: rect.midY - rect.height / 4), control2: CGPoint(x: rect.midX - rect.width / 4, y: rect.minY + rect.height / 4))
        path.addCurve(to: CGPoint(x: rect.maxX, y: rect.midY), control1: CGPoint(x: rect.midX + rect.width / 4, y: rect.minY - rect.height / 4), control2: CGPoint(x: rect.maxX - rect.width / 4, y: rect.midY + rect.height / 4))

        return path
    }
}

struct LeafView: View {
    var body: some View {
        LeafShape()
            .fill(Color.green)
            .rotationEffect(Angle(degrees: Double.random(in: -10..<10)))
    }
}

struct Leaf_Previews: PreviewProvider {
    static var previews: some View {
        LeafView()
            .frame(width: 50, height: 50)
    }
}
