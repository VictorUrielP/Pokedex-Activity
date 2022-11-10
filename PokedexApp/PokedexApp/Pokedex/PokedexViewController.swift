//
//  PokedexViewController.swift
//  PokedexApp
//
//  Created by Victor Pacheco on 08/11/22.
//

import UIKit
import PokedexAPI

final class PokedexViewController: UIViewController {
    
    private lazy var tableView = UITableView(frame: view.bounds, style: .plain)
    private let pokedex = PokedexAPI()
    private(set) lazy var pokemons: [PokemonCellViewData] = Array(pokedex.adaptToPokemonCellViewData()[...9]) {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        }
    }
    private var countPokemon: Int = 0
    private(set) lazy var allPokemons: [PokemonCellViewData] = Array(pokedex.adaptToPokemonCellViewData())
    private lazy var spinner = UIActivityIndicatorView()
    
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
    
    private func createSpinner() -> UIView {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 100))
        spinner = UIActivityIndicatorView()
        spinner.center = footerView.center
        footerView.addSubview(spinner)
        spinner.startAnimating()
        return footerView
    }
}

extension PokedexViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let pokemonCellViewData = pokemons[indexPath.row]
        let pokemonDetailViewData = PokemonDetailViewData(image: pokemonCellViewData.image ?? UIImage(), name: pokemonCellViewData.name)
        let detailViewController =  DetailViewController(pokemonDetailViewData: pokemonDetailViewData)
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        tableView.tableFooterView = createSpinner()
        if indexPath.row == pokemons.count - 1 && countPokemon < allPokemons.count {
            countPokemon = countPokemon + 10
            if countPokemon < allPokemons.count {
                let arrays = Array(pokedex.adaptToPokemonCellViewData()[countPokemon...countPokemon + 9])
                pokemons.append(contentsOf: arrays)
            }
        } else {
            return
        }
        spinner.stopAnimating()
    }
}

extension PokedexViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cellController = tableView.dequeueReusableCell(withIdentifier: PokemonCellController.identifier, for: indexPath) as? PokemonCellController else { return UITableViewCell() }
        let pokemon = pokemons[indexPath.row]
        if #available(iOS 14.0, *) {
            return cellController.configured(with: pokemon)
        } else {
            return UITableViewCell()
        }
    }
}
