//
//  MainViewControllerFactory.swift
//  PokedexApp
//
//  Created by Victor Pacheco on 08/11/22.
//

import UIKit

final class MainViewControllerFactory {
    func make() -> MainViewController {
        let mainStoryboard = UIStoryboard(name: "MainViewController", bundle: nil)
        guard let mainViewController = mainStoryboard.instantiateViewController(withIdentifier: "MainViewController") as? MainViewController else {
            return MainViewController()
        }
        return mainViewController
    }
}
