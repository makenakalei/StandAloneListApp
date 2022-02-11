//
//  CardImage.swift
//  StandaloneApp
//
//  Created by Makena Robison on 2/9/22.
//

import SwiftUI

struct CardImage: View {
    var image: Image
    
    var body: some View {
        image
            .resizable()
            .scaledToFit()
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous)).frame(width: 270, height: 468)
            .overlay {
                RoundedRectangle(cornerRadius: 20, style: .continuous).stroke(.black, lineWidth: 2)
            }
            .shadow(radius: 8)
    }
}

struct CardImage_Previews: PreviewProvider {
    static var previews: some View {
        CardImage(image: Image("RWS_Tarot_00_Fool"))
    }
}
