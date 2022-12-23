//
//  ChampionsView.swift
//  LeagueOfLegends
//
//  Created by Hollis Kwan on 10/8/22.
//
 
import Foundation
import UIKit

class ChampionsView: UIView {
    
    let leagueLogoImageView: UIImageView = {
        let logo = UIImageView()
        logo.image = UIImage(named: "leagueoflegends")
        logo.contentMode = .scaleAspectFit
        logo.translatesAutoresizingMaskIntoConstraints = false
        return logo
    }()
    
    let tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(ChampionsCustomCell.self, forCellReuseIdentifier: ChampionsCustomCell.identifer)
        table.backgroundColor = .clear
        table.clipsToBounds = true
        return table
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        guard let image = UIImage(named: "stone") else { return }
        backgroundColor = UIColor(patternImage: image)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        addSubview(tableView)
        addSubview(leagueLogoImageView)
        
        leagueLogoImageView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor).isActive = true
        leagueLogoImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        leagueLogoImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        leagueLogoImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        tableView.topAnchor.constraint(equalTo: leagueLogoImageView.bottomAnchor, constant: 20).isActive = true
        tableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor).isActive = true
    }
}
