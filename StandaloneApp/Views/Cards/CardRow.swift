//
//  CardRow.swift
//  StandaloneApp
//
//  Created by Makena Robison on 2/9/22.
//

import SwiftUI

struct CardRow: View {
    @EnvironmentObject var modelData: ModelData
    var tarotCard: TarotCard
    var body: some View {
        HStack {
            tarotCard.image
                .resizable()
                .frame(width: 70, height: 120)
            Spacer()
                Text(tarotCard.name)
                .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.blue)
                    .multilineTextAlignment(.trailing)
            if tarotCard.isStarred {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                
            }
        }
        .padding(.horizontal)
            
    }
}

struct CardRow_Previews: PreviewProvider {
    static var tarotCards = ModelData().tarotCards
    
    static var previews: some View {
        Group {
            CardRow(tarotCard: tarotCards[0])
            CardRow(tarotCard: tarotCards[1])
        }
        .previewLayout(.fixed(width: 350, height: 130))
    }
}
