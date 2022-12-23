//
//  ChampionsModelController.swift
//  LeagueOfLegends
//
//  Created by Hollis Kwan on 10/8/22.
//

import Foundation
import UIKit

class ChampionsModelController {
    static let shared = ChampionsModelController()
    
    private init() {}
    
    var domainModels = [ChampionsDomainModel]()
    
    func updateDomainModel(name: String?, image: UIImage?) {
        guard let index = domainModels.firstIndex(where: { $0.name == name }) else { return }
        domainModels[index].image = image
    }
}
