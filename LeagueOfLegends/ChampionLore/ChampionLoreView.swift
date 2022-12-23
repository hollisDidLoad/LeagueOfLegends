//
//  ChampionLoreView.swift
//  LeagueOfLegends
//
//  Created by Hollis Kwan on 10/8/22.
//

import Foundation
import UIKit

class ChampionLoreView: UIView {
    
    let championImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let championNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.italicSystemFont(ofSize: 30)
        label.textColor = .white.withAlphaComponent(0.6)
        return label
    }()
    
     let championDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.textColor = .white.withAlphaComponent(0.6)
        label.numberOfLines = 0
        return label
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
        addSubview(championNameLabel)
        addSubview(championImageView)
        addSubview(championDescriptionLabel)
        
        championImageView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: 100).isActive = true
        championImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        championImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive = true
        championImageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        championNameLabel.topAnchor.constraint(equalTo: championImageView.bottomAnchor, constant: 10).isActive = true
        championNameLabel.leadingAnchor.constraint(equalTo: championImageView.leadingAnchor).isActive = true
        championNameLabel.trailingAnchor.constraint(equalTo: championImageView.trailingAnchor).isActive = true
        championNameLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        championDescriptionLabel.topAnchor.constraint(equalTo: championNameLabel.bottomAnchor, constant: 10).isActive = true
        championDescriptionLabel.leadingAnchor.constraint(equalTo: championNameLabel.leadingAnchor).isActive = true
        championDescriptionLabel.trailingAnchor.constraint(equalTo: championNameLabel.trailingAnchor).isActive = true
        championDescriptionLabel.heightAnchor.constraint(equalToConstant: 250).isActive = true
    }
    
    func configure(_ viewModel: ChampionLoreViewModel) {
        championNameLabel.text = viewModel.name
        championDescriptionLabel.text = viewModel.description
        championImageView.image = viewModel.image
    }
}
