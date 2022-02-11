//
//  TarotCard.swift
//  StandaloneApp
//
//  Created by Makena Robison on 2/9/22.
//

import Foundation
import SwiftUI

struct TarotCard: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var type: String
    var upright: String
    var reversed: String
    var description: String
    var isStarred: Bool
    
    private var imageName: String
    var image: Image{
        Image(imageName)
    }
}
