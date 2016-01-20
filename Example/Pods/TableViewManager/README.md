# TableViewManager

[![Version](https://img.shields.io/cocoapods/v/TableViewManager.svg?style=flat)](http://cocoapods.org/pods/TableViewManager)
[![License](https://img.shields.io/cocoapods/l/TableViewManager.svg?style=flat)](http://cocoapods.org/pods/TableViewManager)
[![Platform](https://img.shields.io/cocoapods/p/TableViewManager.svg?style=flat)](http://cocoapods.org/pods/TableViewManager)

## Installation

TableViewManager is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "TableViewManager"
```

## Quick Start

### Step 1

Remember about `import TableViewManager`.

### Step 2

Create `TableViewCellsIdentifiers` enum in your View Controller.

```swift
class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    // 1. Cell identifier should be the same as you set in .xib file.
    // 2. Every cell should be in separated file named as identifier,
    //    but you can redefine file name and put multiple cells in one file (see: step 4)
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
```

### Step 3

Implemment `tableView(_:cellForRowAtIndexPath:)` as below.

```swift
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return self.tableViewManager(tableView, cellForRowAtIndexPath: indexPath)
    }

    // (...)
}
```

### Step 4

Implemment `TableViewManagerProtocol`.

```swift
extension ViewController: TableViewManagerProtocol {
    // Return cell indentifier for provided indexPath
    func tableView(tableView: UITableView, cellIdentifierForIndexPath indexPath: NSIndexPath) -> TableViewCellsIdentifiers {
        return .TextTableViewCell
    }

    // Configure cell as before in tableView(_:cellForRowAtIndexPath:)
    func tableView(tableView: UITableView, configureCell cell: UITableViewCell, withCellIdentifier cellIdentifier: TableViewCellsIdentifiers, forIndexPath indexPath: NSIndexPath) {
        if let cell = cell as? TextTableViewCell {
            cell.myLabel.text = "Lorem Ipsum"
        }
    }

    // Implemment if you want to change default Nib name
    //func tableView(tableView: UITableView, nibNameForCellIdentifier cellIdentifier: TableViewCellsIdentifiers) -> String? {
    //    return nil
    //}
}
```

That's all!

## License

TableViewManager is available under the MIT license. See the LICENSE file for more info.
