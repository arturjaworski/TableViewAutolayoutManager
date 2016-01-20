//
//  TableViewManager.swift
//  Pods
//
//  Created by Artur Jaworski on 19.01.2016.
//
//

public protocol TableViewManagerProtocol {
    typealias TableViewCellsIdentifiers: RawRepresentable
    
    func tableView(tableView: UITableView, cellIdentifierForIndexPath indexPath: NSIndexPath) -> TableViewCellsIdentifiers
    func tableView(tableView: UITableView, configureCell cell: UITableViewCell, withCellIdentifier cellIdentifier: TableViewCellsIdentifiers, forIndexPath indexPath: NSIndexPath)
    func tableView(tableView: UITableView, nibNameForCellIdentifier cellIdentifier: TableViewCellsIdentifiers) -> String?
}

public extension TableViewManagerProtocol where Self: protocol<UITableViewDelegate, UITableViewDataSource>, TableViewCellsIdentifiers.RawValue == String {
    
    func tableView(tableView: UITableView, nibNameForCellIdentifier cellIdentifier: TableViewCellsIdentifiers) -> String? {
        return nil
    }
    
    func tableViewManager(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = self.tableView(tableView, cellIdentifierForIndexPath: indexPath)
        let cell: UITableViewCell = self.dequeueReusableCell(tableView, forIdentifier: cellIdentifier)
        
        self.tableView(tableView, configureCell: cell, withCellIdentifier: cellIdentifier, forIndexPath: indexPath)
        return cell
    }
    
    func dequeueReusableCell(tableView: UITableView, forIdentifier cellIdentifier: TableViewCellsIdentifiers) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier.rawValue) {
            return cell
        }

        self.registerCell(tableView, forIdentifier: cellIdentifier)
        return tableView.dequeueReusableCellWithIdentifier(cellIdentifier.rawValue)!
    }
    
    private func registerCell(tableView: UITableView, forIdentifier cellIdentifier: TableViewCellsIdentifiers) {
        
        var nibName: String
        if let name = self.tableView(tableView, nibNameForCellIdentifier: cellIdentifier) {
            nibName = name
        }
        else {
            nibName = cellIdentifier.rawValue
        }
        
        tableView.registerNib(
            UINib(nibName: nibName, bundle: nil),
            forCellReuseIdentifier: cellIdentifier.rawValue
        )
    }
    
}