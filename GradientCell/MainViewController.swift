//
//  ViewController.swift
//  GradientCell
//
//  Created by Alex Golovaschenko on 3/20/19.
//  Copyright © 2019 Alex Golovaschenko. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    let tableDataSource: TableDataSource = {
        let data = (0..<1000).map { _ in
            RandomTextGenerator.generate(minLength: 3, maxLength: 6)
        }
        return TableDataSource(data: data)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    private func setupTableView() {
        self.tableView.register(GradientCell.self, forCellReuseIdentifier: GradientCell.reuseIdentifier)
        self.tableView.dataSource = self.tableDataSource
        self.tableView.separatorStyle = .none
    }
}

