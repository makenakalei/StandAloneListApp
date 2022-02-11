//
//  BadgeBackground.swift
//  StandaloneApp
//
//  Created by Makena Robison on 2/10/22.
//

import SwiftUI

struct BadgeBackground: View {
    var body: some View {
        GeometryReader { geometry in
        Path { path in
            var width: CGFloat = min(geometry.size.width, geometry.size.height)
            let height = width
            let xScale: CGFloat = 0.832
            let xOffset = (width * (1.0 - xScale)) / 2.0
            width *= xScale
            path.move(
                to: CGPoint(
                    x: width * 0.95 + xOffset,
                    y: height * (0.20 + StarParameters.adjustment)
                )
            )
            StarParameters.segments.forEach { segment in
                path.addLine(
                    to: CGPoint(
                        x: width * segment.line.x + xOffset,
                        y: height * segment.line.y
                    )
                )
                
                path.addQuadCurve(
                    to: CGPoint(
                        x: width * segment.curve.x + xOffset,
                        y: height * segment.curve.y
                    ),
                    control: CGPoint(
                        x: width * segment.control.x + xOffset,
                        y: height * segment.control.y
                    )
                )
            }
        }
        .fill(.linearGradient(
            Gradient(colors: [Self.gradientStart, Self.gradientEnd]),
            startPoint: UnitPoint(x: 0.5, y: 0),
            endPoint: UnitPoint(x: 0.5, y: 0.6)
        ))
    }
        .aspectRatio(1, contentMode: .fit)
    }
    static let gradientStart = Color(red: 200.0 / 255, green: 50.0 / 255, blue: 255.0 / 255)
    static let gradientEnd = Color(red: 100.0 / 255, green: 70.0 / 255, blue: 200.0 / 255)
}

struct BadgeBackground_Previews: PreviewProvider {
    static var previews: some View {
        BadgeBackground()
    }
}
