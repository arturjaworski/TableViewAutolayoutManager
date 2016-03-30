//
//  TableViewManager.swift
//  Pods
//
//  Created by Artur Jaworski on 19.01.2016.
//
//

public protocol TableViewManager {
    func tableView(tableView: UITableView, cellIdentifierForIndexPath indexPath: NSIndexPath) -> String

    /* optional */
    func tableView(tableView: UITableView, configureCell cell: UITableViewCell, forIndexPath indexPath: NSIndexPath)
    func tableView(tableView: UITableView, nibNameForCellIdentifier cellIdentifier: String) -> String?
}

public extension TableViewManager {

    func tableViewManager(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = self.tableView(tableView, cellIdentifierForIndexPath: indexPath)
        let cell: UITableViewCell = self.tableViewManager(tableView, dequeueReusableCellForIdentifier: cellIdentifier)

        self.tableView(tableView, configureCell: cell, forIndexPath: indexPath)
        return cell
    }

    func tableViewManager(tableView: UITableView, dequeueReusableCellForIdentifier cellIdentifier: String) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) {
            return cell
        }

        self.registerCell(tableView, forIdentifier: cellIdentifier)
        return tableView.dequeueReusableCellWithIdentifier(cellIdentifier)!
    }

    /* default implementation */
    func tableView(tableView: UITableView, nibNameForCellIdentifier cellIdentifier: String) -> String? {
        return nil
    }

    func tableView(tableView: UITableView, configureCell cell: UITableViewCell, forIndexPath indexPath: NSIndexPath) {

    }

    /* private */
    private func registerCell(tableView: UITableView, forIdentifier cellIdentifier: String) {
        var nibName: String
        if let name = self.tableView(tableView, nibNameForCellIdentifier: cellIdentifier) {
            nibName = name
        }
        else {
            nibName = cellIdentifier
        }

        tableView.registerNib(
            UINib(nibName: nibName, bundle: nil),
            forCellReuseIdentifier: cellIdentifier
        )
    }
    
}