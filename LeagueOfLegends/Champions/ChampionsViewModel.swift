//
//  ChampionsViewModel.swift
//  LeagueOfLegends
//
//  Created by Hollis Kwan on 10/8/22.
//

import Foundation
import UIKit

class ChampionsViewModel {
    
    var cellViewModel = [ChampionsCellViewModel]()
    
    func fetchChampions(completion: @escaping () -> Void) {
        NetworkManager.shared.fetchChampionData(completion: { [weak self] championAPIModel in
            let domainModels = championAPIModel.map { ChampionsDomainModel($0) }
            self?.cellViewModel = domainModels.map { ChampionsCellViewModel($0) }
            ChampionsModelController.shared.domainModels = domainModels
            DispatchQueue.main.async {
                completion()
            }
        })
    }
    
    private func updateCellViewModel(name: String?, image: UIImage?) -> ChampionsCellViewModel? {
        guard let index = cellViewModel.firstIndex(where: { $0.name == name }) else { return nil }
        var newCellViewModel = cellViewModel[index]
        newCellViewModel.image = image
        cellViewModel[index] = newCellViewModel
        return newCellViewModel
    }
    
    func fetchChampionsImage(
        with url: URL,
        cellViewModel: ChampionsCellViewModel,
        completion: @escaping (ChampionsCellViewModel) -> Void
    ) {
        NetworkManager.shared.fetchImage(with: url, completion: { data in
            let championImage = UIImage(data: data)
            guard let newCellViewModel = self.updateCellViewModel(name: cellViewModel.name, image: championImage) else { return }
            ChampionsModelController.shared.updateDomainModel(name: cellViewModel.name, image: championImage)
            DispatchQueue.main.async {
                completion(newCellViewModel)
            }
        })
    }
    
    func setUpTableViewSelectedData(with indexPath: IndexPath, completion: @escaping (UIViewController) -> Void) {
        let championLoreVC = ChampionLoreViewController()
        let domainModel = ChampionsModelController.shared.domainModels[indexPath.row]
        let championLoreViewModel = ChampionLoreViewModel(domainModel)
        championLoreVC.championLoreViewModel = championLoreViewModel
        completion(championLoreVC)
    }
}
