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
    private var pokemons: [PokemonCellViewData] = []
    
    private let pokedexApi = PokedexAPI()
    override func viewDidLoad() {
        super.viewDidLoad()
        pokemons = pokedexApi.getCellViewData()
        configureTableView()
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(PokemonCellController.self, forCellReuseIdentifier: PokemonCellController.identifier)
        view.addSubview(tableView)
    }
    
}

extension PokedexViewController: UITableViewDelegate {
    
}

extension PokedexViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cellController = tableView.dequeueReusableCell(withIdentifier: PokemonCellController.identifier) as? PokemonCellController else {
            return UITableViewCell()
        }
        let pokemon = pokemons[indexPath.row]
        return cellController.configured(with: pokemon)
    }
}
