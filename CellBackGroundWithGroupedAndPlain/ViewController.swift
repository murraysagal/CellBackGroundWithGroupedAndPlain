//
//  ViewController.swift
//  CellBackGroundWithGroupedAndPlain
//
//  Created by Murray Sagal on 2019-03-13.
//  Copyright © 2019 Murray Sagal. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    let model = "abcdefghijklmnopqrstuvwxyz".map{return String($0)}
    var style: UITableView.Style = .plain
    var navBarTitle = "Plain"

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = navBarTitle
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(reload))
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    // MARK: - Table view
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = model[indexPath.row]
        cell.backgroundColor = indexPath.row % 2 == 0 ? .lightGray : nil
        return cell
    }

    @objc func reload() {
        style = style == .plain ? .grouped : .plain
        navBarTitle = style == .plain ? "Plain" : "Grouped"
        navigationItem.title = navBarTitle
        tableView = UITableView(frame: CGRect.zero, style: style)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.reloadData()
    }
}
