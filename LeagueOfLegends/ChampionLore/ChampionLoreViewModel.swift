//
//  ChampionLoreViewModel.swift
//  LeagueOfLegends
//
//  Created by Hollis Kwan on 10/8/22.
//

import Foundation
import UIKit

struct ChampionLoreViewModel {
    let name: String?
    let description: String?
    var image: UIImage?
    
    init(_ model: ChampionsDomainModel) {
        self.name = model.name
        self.description = model.description
        self.image = model.image
    }
}
