//
//  ChampionsDomainModel.swift
//  LeagueOfLegends
//
//  Created by Hollis Kwan on 10/8/22.
//

import Foundation
import UIKit

struct ChampionsDomainModel {
    let name: String?
    let title: String?
    let imageUrl: URL?
    var image: UIImage?
    let description: String?
    let tags: [String]?
    
    init(_ APIModel: ChampionsAPIModel) {
        self.name = APIModel.name
        self.title = APIModel.title
        self.imageUrl = APIModel.imageUrl
        self.image = nil
        self.description = APIModel.description
        self.tags = APIModel.tags
    }
}
