# TableViewAutolayoutManager

[![Version](https://img.shields.io/cocoapods/v/TableViewAutolayoutManager.svg?style=flat)](http://cocoapods.org/pods/TableViewAutolayoutManager)
[![License](https://img.shields.io/cocoapods/l/TableViewAutolayoutManager.svg?style=flat)](http://cocoapods.org/pods/TableViewAutolayoutManager)
[![Platform](https://img.shields.io/cocoapods/p/TableViewAutolayoutManager.svg?style=flat)](http://cocoapods.org/pods/TableViewAutolayoutManager)

## Description

<img src="/Demo/screenshot1.png" width="250">

Automatically takes care of custom UITableViewCell dynamic height. Written in Swift.

## Installation

TableViewAutolayoutManager is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "TableViewAutolayoutManager"
```

## Quick Start

### Before you use it

TableViewAutolayoutManager inherits from TableViewManager. Please [see TableViewManager](https://github.com/arturjaworski/TableViewManager) first.

Please be sure that you have to use this pod. In most cases [self sizing cells](https://developer.apple.com/library/ios/documentation/UserExperience/Conceptual/AutolayoutPG/WorkingwithSelf-SizingTableViewCells.html) is enough.

TableViewAutolayoutManager using UIView `systemLayoutSizeFittingSize(_:)` to calculate height.

### Step 1

Do all steps described in [TableViewManager](https://github.com/arturjaworski/TableViewManager), but do it with `TableViewAutolayoutManager` instead of `TableViewManager` and `TableViewAutolayoutManagerProtocol` instead of `TableViewManagerProtocol`.

```swift
import TableViewAutolayoutManager
```

```swift
extension ViewController: TableViewAutolayoutManagerProtocol {
    // (...)
}
```

### Step 2

Implemment `tableView(_:heightForRowAtIndexPath:)` as below.

```swift
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return self.tableViewAutolayoutManager(tableView, heightForRowAtIndexPath: indexPath)
    }

    // (...)
}
```

That's all!

## License

TableViewAutolayoutManager is available under the MIT license. See the LICENSE file for more info.
