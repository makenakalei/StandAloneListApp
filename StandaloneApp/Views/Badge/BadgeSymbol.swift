//
//  BadgeSymbol.swift
//  StandaloneApp
//
//  Created by Makena Robison on 2/10/22.
//

import SwiftUI

struct BadgeSymbol: View {
    var body: some View {
        Circle().stroke(.white, lineWidth: 2.0)
            .shadow(radius: 3.0)
            .frame(width: 225, height: 2225)
            .overlay {
                Star(corners: 8, smoothness: 0.45).stroke(.white, lineWidth: 2.0)
                    .shadow(radius: 3.0)
                    .frame(width: 300, height: 300)
            }
    }
}

// credit to: https://www.hackingwithswift.com/quick-start/swiftui/how-to-draw-polygons-and-stars

struct Star: Shape {
    let corners: Int
    let smoothness: CGFloat

    func path(in rect: CGRect) -> Path {
        guard corners >= 2 else { return Path() }

        let center = CGPoint(x: rect.width / 2, y: rect.height / 2)

        var currentAngle = -CGFloat.pi / 2

        let angleAdjustment = .pi * 2 / CGFloat(corners * 2)

        let innerX = center.x * smoothness
        let innerY = center.y * smoothness


        var path = Path()


        path.move(to: CGPoint(x: center.x * cos(currentAngle), y: center.y * sin(currentAngle)))

        var bottomEdge: CGFloat = 0

        for corner in 0..<corners * 2  {

            let sinAngle = sin(currentAngle)
            let cosAngle = cos(currentAngle)
            let bottom: CGFloat

            
            if corner.isMultiple(of: 2) {
                
                bottom = center.y * sinAngle

                
                path.addLine(to: CGPoint(x: center.x * cosAngle, y: bottom))
            } else {
                
                bottom = innerY * sinAngle

                path.addLine(to: CGPoint(x: innerX * cosAngle, y: bottom))
            }

            
            if bottom > bottomEdge {
                bottomEdge = bottom
            }


            currentAngle += angleAdjustment
        }


        let unusedSpace = (rect.height / 2 - bottomEdge) / 2

        
        let transform = CGAffineTransform(translationX: center.x, y: center.y + unusedSpace)
        return path.applying(transform)
    }
}

struct BadgeSymbol_Previews: PreviewProvider {
    static var previews: some View {
        BadgeSymbol()
    }
}
