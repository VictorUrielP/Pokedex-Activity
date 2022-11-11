//
//  PokedexViewController.swift
//  PokedexApp
//
//  Created by Victor Pacheco on 08/11/22.
//

import UIKit

final class PokedexViewController: UIViewController {
    
    private lazy var tableView = UITableView(frame: view.bounds, style: .plain)
    private lazy var spinner = UIActivityIndicatorView()
    
    var pokedexViewModel: PokedexViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        bind()
    }
    
    private func configureTableView() {
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(PokemonCellController.self, forCellReuseIdentifier: PokemonCellController.identifier)
    }

    private func createSpinner() -> UIView {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 100))
        spinner.center = footerView.center
        footerView.addSubview(spinner)
        spinner.startAnimating()
        return footerView
    }
    
    private func bind() {
        pokedexViewModel?.shouldStartLoading = { [weak self] in
            guard let self = self else { return }
            self.tableView.tableFooterView = self.createSpinner()
        }
        pokedexViewModel?.didRecieveNewPokemons = { [weak self] in
            guard let self = self else { return }
            self.spinner.stopAnimating()
            self.tableView.tableFooterView = nil
            self.tableView.reloadData()
        }
    }
}

extension PokedexViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let pokedexViewData = pokedexViewModel else { return }
        let pokemonCellViewData = pokedexViewData.pokemonCellViewData(at: indexPath.row)
        let pokemonDetailViewData = PokemonDetailViewData(image: pokemonCellViewData.image, name: pokemonCellViewData.name)
        let detailViewController =  DetailViewController(pokemonDetailViewData: pokemonDetailViewData)
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        pokedexViewModel?.didScrollTo(row: indexPath.row)
    }
}

extension PokedexViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let pokedexViewData = pokedexViewModel else { return 0 }
        return pokedexViewData.pokemonsCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard  let pokedexViewData = pokedexViewModel, let cellController = tableView.dequeueReusableCell(withIdentifier: PokemonCellController.identifier, for: indexPath) as? PokemonCellController else { return UITableViewCell() }
        let pokemon = pokedexViewData.pokemonCellViewData(at: indexPath.row)
        cellController.delegate = pokedexViewData
        return cellController.configured(with: pokemon)
    }
}
