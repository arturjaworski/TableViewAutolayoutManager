//
//  TableViewAutolayoutManager.swift
//  Pods
//
//  Created by Artur Jaworski on 20.01.2016.
//
//

import Foundation
import TableViewManager

public protocol TableViewAutolayoutManager {
}

public extension TableViewAutolayoutManager where Self: protocol<TableViewManager> {

    func tableViewAutolayoutManager(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let cellIdentifier = self.tableView(tableView, cellIdentifierForIndexPath: indexPath)
        var sizingCell = TableViewAutolayoutManagerStoringHelper.sharedManager.sizingCell(tableView, identifier: cellIdentifier)

        if sizingCell == nil {
            sizingCell = self.tableViewManager(tableView, dequeueReusableCellForIdentifier: cellIdentifier)
            TableViewAutolayoutManagerStoringHelper.sharedManager.storeSizingCell(tableView, identifier: cellIdentifier, sizingCell: sizingCell!)
        }

        self.tableView(tableView, configureCell: sizingCell!, forIndexPath: indexPath)
        return self.calculateHeightForConfiguredSizingCell(tableView, sizingCell: sizingCell!)
    }

    private func calculateHeightForConfiguredSizingCell(tableView: UITableView, sizingCell: UITableViewCell) -> CGFloat {
        sizingCell.bounds = CGRectMake(0, 0, CGRectGetWidth(tableView.frame), CGRectGetHeight(sizingCell.bounds))

        sizingCell.setNeedsLayout()
        sizingCell.layoutIfNeeded()

        let size: CGSize = sizingCell.contentView.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize)
        return size.height + 1
    }

}

internal class TableViewAutolayoutManagerStoringHelper {
    var sizingCells: [NSValue : [String : UITableViewCell]] = [:]

    static let sharedManager = TableViewAutolayoutManagerStoringHelper()

    func sizingCell(tableView: UITableView, identifier: String) -> UITableViewCell? {
        let key = NSValue(nonretainedObject: tableView)
        return self.sizingCells[key]?[identifier]
    }

    func storeSizingCell(tableView: UITableView, identifier: String, sizingCell: UITableViewCell) {
        let key = NSValue(nonretainedObject: tableView)
        if self.sizingCells[key] == nil {
            self.sizingCells[key] = [:]
        }
        self.sizingCells[key]![identifier] = sizingCell
    }
}