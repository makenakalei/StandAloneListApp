//
//  ContentView.swift
//  StandaloneApp
//
//  Created by Makena Robison on 1/27/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        CardList()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
