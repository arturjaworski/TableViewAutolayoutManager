//
//  ViewController.swift
//  TableViewAutolayoutManager
//
//  Created by Artur Jaworski on 01/20/2016.
//  Copyright (c) 2016 Artur Jaworski. All rights reserved.
//

import UIKit
import TableViewManager
import TableViewAutolayoutManager

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    enum TableViewCellsIdentifiers: String {
        case TextTableViewCell
        case ImageTableViewCell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return self.tableViewAutolayoutManager(tableView, heightForRowAtIndexPath: indexPath)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return self.tableViewManager(tableView, cellForRowAtIndexPath: indexPath)
    }
}

extension ViewController: TableViewManager, EnumTableViewManager, TableViewAutolayoutManager {
    func tableView(tableView: UITableView, cellIdentifierForIndexPath indexPath: NSIndexPath) -> TableViewCellsIdentifiers {
        if indexPath.section == 1 {
            return .ImageTableViewCell
        }
        return .TextTableViewCell
    }
    
    func tableView(tableView: UITableView, configureCell cell: UITableViewCell, forIndexPath indexPath: NSIndexPath) {
        if let cell = cell as? TextTableViewCell {
            cell.myLabel.text = indexPath.row == 0 ? "Lorem Ipsum" : "Lorem ipsum dolor sit amet, cu per sensibus quaerendum, eam ut veniam postulant reformidans. Quodsi periculis no eos. Soleat audiam eu sed, quo esse platonem reprehendunt ei, eu vero rebum mel. Corpora tractatos evertitur ex mea, eu vim minim fabellas, quot tempor explicari mel ex. Sea no dicat atqui homero, ex dictas antiopam comprehensam eum."
        }
        else if let cell = cell as? ImageTableViewCell {
            cell.myImageView.image = indexPath.row == 0 ? UIImage(named: "100x100") : UIImage(named: "100x50")
        }
    }
}