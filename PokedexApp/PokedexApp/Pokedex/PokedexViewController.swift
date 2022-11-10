//
//  PokedexViewController.swift
//  PokedexApp
//
//  Created by Victor Pacheco on 08/11/22.
//

import UIKit

final class PokedexViewController: UIViewController {
    
    private lazy var tableView = UITableView(frame: view.bounds, style: .plain)
    
    var pokedexViewData: PokedexViewData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    private func configureTableView() {
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(PokemonCellController.self, forCellReuseIdentifier: PokemonCellController.identifier)
    }
        
}

extension PokedexViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let pokedexViewData = pokedexViewData else { return }
        let pokemonCellViewData = pokedexViewData.pokemons[indexPath.row]
        let pokemonDetailViewData = PokemonDetailViewData(image: pokemonCellViewData.image, name: pokemonCellViewData.name)
        let detailViewController =  DetailViewController(pokemonDetailViewData: pokemonDetailViewData)
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}

extension PokedexViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let pokedexViewData = pokedexViewData else { return 0 }
        return pokedexViewData.pokemons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let pokedexViewData = pokedexViewData, let cellController = tableView.dequeueReusableCell(withIdentifier: PokemonCellController.identifier, for: indexPath) as? PokemonCellController else { return UITableViewCell() }
        cellController.delegate = self
        let pokemon = pokedexViewData.pokemons[indexPath.row]
        return cellController.configured(with: pokemon)
    }
}

extension PokedexViewController: FavoriteSelectDelegate {
    func didPressFavoriteButton(for pokemon: PokemonCellViewData) {
        self.pokedexViewData?.add(for: pokemon)
        self.tableView.reloadData()
    }
}
