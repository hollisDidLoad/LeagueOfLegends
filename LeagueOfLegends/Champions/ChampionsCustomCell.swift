//
//  ChampionsCustomCell.swift
//  LeagueOfLegends
//
//  Created by Hollis Kwan on 10/8/22.
//

import Foundation
import UIKit

class ChampionsCustomCell: UITableViewCell {
    
    static var identifer: String {
        String(describing: self)
    }
    
    let championImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    var championNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 0
        label.textColor = .gray
        return label
    }()
    
    let championTitleNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.italicSystemFont(ofSize: 15)
        label.textColor = .systemGray
        label.numberOfLines = 0
        return label
    }()
    
    var championTagsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.numberOfLines = 0
        label.textColor = .systemGray
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        contentView.addSubview(championImageView)
        contentView.addSubview(championNameLabel)
        contentView.addSubview(championTagsLabel)
        contentView.addSubview(championTitleNameLabel)
        
        championImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        championImageView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 10).isActive = true
        championImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        championImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        championNameLabel.leadingAnchor.constraint(equalTo: championImageView.trailingAnchor, constant: 5).isActive = true
        championNameLabel.topAnchor.constraint(equalTo: championImageView.topAnchor, constant: 15).isActive = true
        championNameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        championNameLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        championTitleNameLabel.topAnchor.constraint(equalTo: championNameLabel.bottomAnchor, constant: 3).isActive = true
        championTitleNameLabel.leadingAnchor.constraint(equalTo: championNameLabel.leadingAnchor).isActive = true
        championTitleNameLabel.trailingAnchor.constraint(equalTo: championTagsLabel.leadingAnchor, constant: -10).isActive = true
        championTitleNameLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        championTagsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        championTagsLabel.topAnchor.constraint(equalTo: championImageView.topAnchor).isActive = true
        championTagsLabel.bottomAnchor.constraint(equalTo: championImageView.bottomAnchor).isActive = true
        championTagsLabel.widthAnchor.constraint(equalToConstant: 120).isActive = true
    }
    
    func configure(_ cellViewModel: ChampionsCellViewModel) {
        championNameLabel.text = cellViewModel.name
        championTitleNameLabel.text = cellViewModel.title
        championTagsLabel.text = cellViewModel.tags
        championImageView.image = cellViewModel.image
        backgroundColor = .clear.withAlphaComponent(0.4)
    }
}
