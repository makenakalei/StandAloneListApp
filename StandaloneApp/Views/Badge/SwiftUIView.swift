//
//  SwiftUIView.swift
//  StandaloneApp
//
//  Created by Makena Robison on 2/10/22.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        BadgeBackground()
            .overlay{
                BadgeSymbol()
            }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
