//
//  PokedexViewController.swift
//  PokedexApp
//
//  Created by mvazquezl on 08/11/22.
//

import UIKit

final class PokedexViewController: UIViewController {
    
    private lazy var tableView = UITableView(frame: view.bounds, style: .plain)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    func configureTableView(){
        view.addSubview(tableView)
    }
}
