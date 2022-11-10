//
//  FavoritesPokemonViewController.swift
//  PokedexApp
//
//  Created by VICTOR DIMAS MORENO on 10/11/22.
//

import UIKit

class FavoritesPokemonViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var favoritesCollection: UICollectionView!
    
    var arrData : [FavoritesPokemon] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNibs()
        favoritesCollection.delegate = self
        favoritesCollection.dataSource = self
    }
    private func registerNibs() {
        favoritesCollection.register(UINib(nibName:"FavoriteCollectionViewCell" , bundle: nil), forCellWithReuseIdentifier: FavoriteCollectionViewCell.indentifier)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = favoritesCollection.dequeueReusableCell(withReuseIdentifier: FavoriteCollectionViewCell.indentifier , for: indexPath) as? FavoriteCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.setInformation(with: arrData[indexPath.row])
        return cell
    }
}
