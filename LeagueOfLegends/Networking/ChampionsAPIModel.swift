//
//  ChampionsAPIModel.swift
//  LeagueOfLegends
//
//  Created by Hollis Kwan on 10/8/22.
//

import Foundation

struct ChampionsAPIModel: Codable {
    enum CodingKeys: String, CodingKey {
        case imageUrl = "icon"
        case name, title, tags, description
    }
    
    var name: String?
    var title: String?
    var tags: [String]?
    var imageUrl: URL?
    var description: String?
}
