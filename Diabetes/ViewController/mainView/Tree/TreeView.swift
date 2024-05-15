//
//  Tree.swift
//  Diabetes
//
//  Created by Lambert Lani on 5/15/24.
//

import SwiftUI

struct TreeShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.midX, y: rect.minY))

        path.addLine(to: CGPoint(x: rect.midX - rect.width / 8, y: rect.midY / 6))
        path.addLine(to: CGPoint(x: rect.midX - rect.width / 8, y: rect.midY + rect.height / 4))
        path.addLine(to: CGPoint(x: rect.midX - rect.width / 8, y: rect.midY + rect.height / 2))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.midY + rect.height / 2))
        path.addLine(to: CGPoint(x: rect.midX + rect.width / 8, y: rect.midY + rect.height / 2))
        path.addLine(to: CGPoint(x: rect.midX + rect.width / 8, y: rect.midY + rect.height / 4))
        path.addLine(to: CGPoint(x: rect.midX + rect.width / 8, y: rect.midY))

        return path
    }
}

struct TreeView: View {
    var body: some View {
        ZStack {
            TreeShape()
                .fill(Color.brown)

            ForEach(0..<20) { _ in
                LeafView()
                    .position(x: CGFloat.random(in: 0..<1), y: CGFloat.random(in: 0.7..<1))
                    .scaleEffect(CGFloat.random(in: 0.02..<0.1))
                    .rotationEffect(Angle(degrees: Double.random(in: -100..<120)))
                    .animation(
                        Animation.easeInOut(duration: 2)
                            .repeatForever(autoreverses: true)
                    )
            }
//            ForEach(0..<20) { _ in
//                StaticLeafView()
//                    .position(x: CGFloat.random(in: 0..<0.5), y: CGFloat.random(in: 0.9..<1))
//                    .scaleEffect(CGFloat.random(in: 0.01..<0.1))
//                    .rotationEffect(Angle(degrees: Double.random(in: -100..<120)))
//                    .animation(
//                        Animation.easeInOut(duration: 2)
//                            .repeatForever(autoreverses: true)
//                    )
//            }
        }
        .aspectRatio(1, contentMode: .fit)

    }
}

struct Tree_Previews: PreviewProvider {
    static var previews: some View {
        TreeView()
            .frame(width: 300, height: 300)
    }
}
