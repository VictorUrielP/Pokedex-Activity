//
//  PokedexViewController.swift
//  PokedexApp
//
//  Created by Sarahi Pérez Rosas on 08/11/22.
//

import Foundation
import UIKit
final class PokedexViewController: UIViewController{
    private lazy var tableView = UITableView(frame: view.bounds, style: .plain)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    private func configureTableView(){
        view.addSubview(tableView)
    }
}
