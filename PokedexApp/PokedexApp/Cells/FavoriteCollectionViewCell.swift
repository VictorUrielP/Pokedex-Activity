//
//  FavoriteCollectionViewCell.swift
//  PokedexApp
//
//  Created by Alan Emiliano Ramirez Ayala on 10/11/22.
//

import UIKit

class FavoriteCollectionViewCell: UICollectionViewCell {
    
    static let indentifier = String(describing: FavoriteCollectionViewCell.self)
    
    @IBOutlet weak var pokemonImage: UIImageView!
    
    @IBOutlet weak var pokemonName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setInformation(with pokemon: PokemonCellViewData) {
        pokemonImage.image = pokemon.image
        pokemonName.text = pokemon.name
    }
    
}
