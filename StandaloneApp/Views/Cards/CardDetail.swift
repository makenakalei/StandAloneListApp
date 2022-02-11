//
//  CardDetail.swift
//  StandaloneApp
//
//  Created by Makena Robison on 2/10/22.
//

import SwiftUI

struct CardDetail: View {
    @EnvironmentObject var modelData: ModelData
    var tarotCard: TarotCard
    
    var cardIndex: Int {
            modelData.tarotCards.firstIndex(where: { $0.id == tarotCard.id })!
        }

    var body: some View {
        ScrollView{
        VStack{
            CardImage(image: tarotCard.image)
                .padding(.top, 35.0)
            VStack(alignment: .center){
                HStack {
                Text(tarotCard.name)
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.yellow)
                    FavoriteButton(isSet: $modelData.tarotCards[cardIndex].isStarred)

                }
                Text(tarotCard.type)
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundColor(Color.blue)
            }
            .padding(.horizontal, 29.0)
            Divider()
            VStack(alignment: .leading){
                Text("Upright")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Text(tarotCard.upright)
                    .font(.body)
                    .padding(.bottom)
                Text("Reversed")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Text(tarotCard.reversed)
                    .font(.body)
                    .padding(.bottom)
                Text("Description")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Text(tarotCard.description)
                    .font(.body)
                    .padding(.bottom)
            }
            .padding()
    }
        .navigationTitle(tarotCard.name)
        .navigationBarTitleDisplayMode(.inline)
    }
    }
}

struct CardDetail_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        CardDetail(tarotCard: modelData.tarotCards[0])
            .transition(.move(edge: .bottom))
            .environmentObject(modelData)
        
    }
}
