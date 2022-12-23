//
//  ChampionLoreViewController.swift
//  LeagueOfLegends
//
//  Created by Hollis Kwan on 10/8/22.
//

import Foundation
import UIKit

class ChampionLoreViewController: UIViewController {
    
    var contentView = ChampionLoreView()
    var championLoreViewModel: ChampionLoreViewModel?
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let viewModel = championLoreViewModel else { return }
        contentView.configure(viewModel)
    }
}
