//
//  TableDataSource.swift
//  GradientCell
//
//  Created by Alex Golovaschenko on 3/20/19.
//  Copyright © 2019 Alex Golovaschenko. All rights reserved.
//

import UIKit

class TableDataSource: NSObject, UITableViewDataSource {
    
    var data: [String]?
    
    init(data: [String]) {
        self.data = data
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GradientCell.reuseIdentifier) as! GradientCell
        guard let data = data, indexPath.row < data.count else {
            assertionFailure("data is incorrect")
            return cell
        }
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
}
