//
//  PokemonCellController.swift
//  PokedexApp
//
//  Created by Victor Pacheco on 10/11/22.
//

import UIKit

protocol FavoriteSelectDelegate: AnyObject {
    func didPressFavoriteButton(for pokemon: PokemonCellViewData)
}

final class PokemonCellController: UITableViewCell {
    static let identifier = String(describing: PokemonCellController.self)
    private var pokemon: PokemonCellViewData?
    weak var delegate: FavoriteSelectDelegate?
    
    private let favoriteIcon: UIButton = {
        let btnFavorite = UIButton()
        btnFavorite.setImage(UIImage(systemName: "heart"), for: .normal)
        btnFavorite.translatesAutoresizingMaskIntoConstraints = false
        btnFavorite.addTarget(self, action: #selector(setFavorites(_:)), for: .touchUpInside)
        return btnFavorite
    }()
    
    func configured(with pokemon: PokemonCellViewData) -> UITableViewCell {
        self.pokemon = pokemon
        var config = defaultContentConfiguration()
        config.text = pokemon.name
        config.image = pokemon.image
        config.imageProperties.maximumSize = .init(width: 80, height: 80)
        contentConfiguration = config
        favoriteIcon.setImage(pokemon.favoriteImage, for: .normal)
        addSubViews()
        setConstraints()
        return self
    }
    
    private func addSubViews() {
        contentView.addSubview(favoriteIcon)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            favoriteIcon.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            favoriteIcon.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -50),
            favoriteIcon.heightAnchor.constraint(equalToConstant: 24),
            favoriteIcon.widthAnchor.constraint(equalToConstant: 24)
        ])
    }
    
    @objc private func setFavorites(_ sender: UIButton) {
        guard let pokemon = pokemon else {
            return
        }
        delegate?.didPressFavoriteButton(for: pokemon)
    }
}
