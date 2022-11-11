//
//  DetailViewController.swift
//  PokedexApp
//
//  Created by Victor Pacheco on 10/11/22.
//

import UIKit

struct PokemonDetailViewData {
    let image: UIImage
    let name: String
}

final class DetailViewController: UIViewController {
    
    let pokemonImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let pokemonName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let pokemonDetailViewData: PokemonDetailViewData
    
    init(pokemonDetailViewData: PokemonDetailViewData) {
        self.pokemonDetailViewData = pokemonDetailViewData
        super.init(nibName: nil, bundle: nil)
        self.view.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubViews()
        setContraints()
        configure(pokemonDetailViewData: pokemonDetailViewData)
    }
    
    private func configure(pokemonDetailViewData: PokemonDetailViewData) {
        pokemonImage.image = pokemonDetailViewData.image
        pokemonName.text = pokemonDetailViewData.name
    }
    
    private func addSubViews() {
        view.addSubview(pokemonImage)
        view.addSubview(pokemonName)
    }
    
    private func setContraints() {
        NSLayoutConstraint.activate([
            pokemonImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            pokemonImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            pokemonImage.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            pokemonImage.heightAnchor.constraint(equalToConstant: (view.frame.height / 2)),
            
            pokemonName.topAnchor.constraint(equalTo: pokemonImage.bottomAnchor, constant: 16),
            pokemonName.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            pokemonName.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
        ])
    }
}
