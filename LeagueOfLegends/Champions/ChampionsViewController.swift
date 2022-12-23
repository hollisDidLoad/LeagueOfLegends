//
//  ChampionsViewController.swift
//  LeagueOfLegends
//
//  Created by Hollis Kwan on 10/8/22.
//

import Foundation
import UIKit

class ChampionsViewController: UIViewController {
    
    let contentView = ChampionsView()
    let championsViewModel = ChampionsViewModel()
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.tableView.delegate = self
        contentView.tableView.dataSource = self
        championsViewModel.fetchChampions { [weak self] in
            self?.contentView.tableView.reloadData()
        }
    }
}

extension ChampionsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return championsViewModel.cellViewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = contentView.tableView.dequeueReusableCell(withIdentifier: ChampionsCustomCell.identifer) as? ChampionsCustomCell else { return UITableViewCell() }
        let cellViewModel = championsViewModel.cellViewModel[indexPath.row]
        if cellViewModel.image == nil {
            guard let imageUrl = cellViewModel.imageUrl else { return UITableViewCell() }
            championsViewModel.fetchChampionsImage(with: imageUrl, cellViewModel: cellViewModel, completion: { newCellViewModel in
                cell.configure(newCellViewModel)
            })
        } else {
            cell.configure(cellViewModel)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        contentView.tableView.deselectRow(at: indexPath, animated: true)
        championsViewModel.setUpTableViewSelectedData(with: indexPath, completion: { [weak self] championLoreVC in
            self?.present(championLoreVC, animated: true)
        })
    }
}
