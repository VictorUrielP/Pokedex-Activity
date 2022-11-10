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
    private(set) lazy var pokemons: [PokemonCellViewData] = Array(pokedex.adaptToPokemonCellViewData()[...3])
    
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
    
}

extension PokedexViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cellController = tableView.dequeueReusableCell(withIdentifier: PokemonCellController.identifier, for: indexPath) as? PokemonCellController else { return UITableViewCell() }
        let pokemon = pokemons[indexPath.row]
        return cellController.configured(with: pokemon)
    }
}
