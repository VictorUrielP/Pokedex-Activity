//
//  PokedexViewController.swift
//  PokedexApp
//
//  Created by Fredy Dominguez on 08/11/22.
//

import UIKit

final class PokedexViewController: UIViewController {

    private lazy var tableView = UITableView(frame: view.bounds, style: .plain)
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
    }
    
    private func configureTableView() {
        view.addSubview(tableView)
        
    }
}
