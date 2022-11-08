//
//  PokedexViewController.swift
//  PokedexApp
//
//  Created by Alan Emiliano Ramirez Ayala on 08/11/22.
//

import UIKit

class PokedexViewController: UIViewController {
    
    private lazy var tableView = UITableView(frame: view.bounds, style: .plain)

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        // Do any additional setup after loading the view.
    }
    
    private func configureTableView() {
        view.addSubview(tableView)
    }

}
