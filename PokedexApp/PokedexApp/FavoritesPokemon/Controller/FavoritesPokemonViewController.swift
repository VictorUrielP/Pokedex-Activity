//
//  FavoritesPokemonViewController.swift
//  PokedexApp
//
//  Created by VICTOR DIMAS MORENO on 10/11/22.
//

import UIKit

class FavoritesPokemonViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var favoritesCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        favoritesCollection.delegate = self
        favoritesCollection.dataSource = self
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
}
