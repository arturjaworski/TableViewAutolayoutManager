//
//  EnumTableViewManager.swift
//  Pods
//
//  Created by Artur Jaworski on 30.03.2016.
//
//

public protocol EnumTableViewManager {
    associatedtype TableViewCellsIdentifiers: RawRepresentable

    func tableView(tableView: UITableView, cellIdentifierForIndexPath indexPath: NSIndexPath) -> TableViewCellsIdentifiers
}

public extension EnumTableViewManager where Self: protocol<TableViewManager>, TableViewCellsIdentifiers.RawValue == String {
    func tableView(tableView: UITableView, cellIdentifierForIndexPath indexPath: NSIndexPath) -> String {
        return self.tableView(tableView, cellIdentifierForIndexPath: indexPath).rawValue
    }
}