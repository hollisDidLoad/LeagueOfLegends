//
//  ChampionsCellViewModel.swift
//  LeagueOfLegends
//
//  Created by Hollis Kwan on 10/8/22.
//

import Foundation
import UIKit

struct ChampionsCellViewModel {
    let name: String?
    let title: String?
    var image: UIImage?
    let imageUrl: URL?
    let tags: String?
    
    init(_ domainModel: ChampionsDomainModel) {
        self.name = domainModel.name
        self.title = domainModel.title
        self.image = nil
        self.imageUrl = domainModel.imageUrl
        self.tags = domainModel.tags?.joined(separator: "\n----------\n")
    }
}
