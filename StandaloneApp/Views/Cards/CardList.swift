//
//  CardList.swift
//  StandaloneApp
//
//  Created by Makena Robison on 2/10/22.
//

import SwiftUI

struct CardList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showStarredOnly = false
    
    var filteredCards: [TarotCard] {
        modelData.tarotCards.filter { tarotCard in
                (!showStarredOnly || tarotCard.isStarred)
            }
        }

    
    var body: some View {
            NavigationView{
                List {
                    Toggle(isOn: $showStarredOnly) {
                        Text("Starred only")
                    }
                    ForEach(filteredCards) { tarotCard in
                        NavigationLink {
                            CardDetail(tarotCard: tarotCard)
                                .transition(.move(edge: .bottom))
                    
                        } label: {
                            CardRow(tarotCard: tarotCard)
                        }
                    }
                .navigationTitle("Tarot Cards")
                }
            }
        }
    }


    

struct CardList_Previews: PreviewProvider {
    
    static var previews: some View {
        CardList()
            .environmentObject(ModelData())
        
    }
}
