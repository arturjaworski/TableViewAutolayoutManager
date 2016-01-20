//
//  TableViewAutolayoutManager.swift
//  Pods
//
//  Created by Artur Jaworski on 20.01.2016.
//
//

import Foundation
import TableViewManager

public protocol TableViewAutolayoutManagerProtocol: TableViewManagerProtocol {
}

public extension TableViewAutolayoutManagerProtocol where Self: protocol<UITableViewDelegate, UITableViewDataSource>, TableViewCellsIdentifiers.RawValue == String {
    
    func tableViewAutolayoutManager(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let cellIdentifier = self.tableView(tableView, cellIdentifierForIndexPath: indexPath)
        var sizingCell = TableViewAutolayoutManagerSizingCellHelper.sharedManager.sizingCell(tableView, identifier: cellIdentifier.rawValue)
        
        if sizingCell == nil {
            sizingCell = self.dequeueReusableCell(tableView, forIdentifier: cellIdentifier)
            TableViewAutolayoutManagerSizingCellHelper.sharedManager.storeSizingCell(tableView, sizingCell: sizingCell!, identifier: cellIdentifier.rawValue)
        }
        
        self.tableView(tableView, configureCell: sizingCell!, withCellIdentifier: cellIdentifier, forIndexPath: indexPath)
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

internal class TableViewAutolayoutManagerSizingCellHelper {
    var tableViews = [UITableView]()
    var sizingCells = [Dictionary<String,UITableViewCell>]()
    
    static let sharedManager = TableViewAutolayoutManagerSizingCellHelper()
    
    func sizingCell(tableView: UITableView, identifier: String) -> UITableViewCell? {
        // TODO: race condition?
        let i = self.tableViews.indexOf(tableView)
        guard let index = i else { return nil }
        
        let tableViewSizingCells: Dictionary<String,UITableViewCell> = self.sizingCells[index]
        guard let sizingCell = tableViewSizingCells[identifier] else { return nil }
        
        return sizingCell
    }
    
    func storeSizingCell(tableView: UITableView, sizingCell: UITableViewCell, identifier: String) {
        // TODO: race condition?
        var i = self.tableViews.indexOf(tableView)
        if i == nil {
            self.tableViews.append(tableView)
            i = self.tableViews.endIndex-1
            
            self.sizingCells.append(Dictionary<String, UITableViewCell>())
        }
        
        guard let index = i else { return }
        self.sizingCells[index][identifier] = sizingCell
    }
}