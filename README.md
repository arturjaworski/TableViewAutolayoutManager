# TableViewAutolayoutManager

[![Version](https://img.shields.io/cocoapods/v/TableViewAutolayoutManager.svg?style=flat)](http://cocoapods.org/pods/TableViewAutolayoutManager)
[![License](https://img.shields.io/cocoapods/l/TableViewAutolayoutManager.svg?style=flat)](http://cocoapods.org/pods/TableViewAutolayoutManager)
[![Platform](https://img.shields.io/cocoapods/p/TableViewAutolayoutManager.svg?style=flat)](http://cocoapods.org/pods/TableViewAutolayoutManager)

## Description

Automatically takes care of custom UITableViewCell dynamic height. Written in Swift.

<img src="/Demo/screenshot1.png" width="250">

## Installation

TableViewAutolayoutManager is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "TableViewAutolayoutManager"
```

## Quick Start

### Before you use it

TableViewAutolayoutManager requires TableViewManager. Please [see TableViewManager](https://github.com/arturjaworski/TableViewManager) first.

Please be sure that you have to use this pod. In most cases [self sizing cells](https://developer.apple.com/library/ios/documentation/UserExperience/Conceptual/AutolayoutPG/WorkingwithSelf-SizingTableViewCells.html) is enough.

TableViewAutolayoutManager using UIView `systemLayoutSizeFittingSize(_:)` to calculate height.

### Step 1

Do all steps described in [TableViewManager](https://github.com/arturjaworski/TableViewManager). Remember that you don't need to use enum if you don't want to.

### Step 2

Remember about import.

```swift
import TableViewAutolayoutManager
```

```swift
class ViewController: UIViewController, TableViewAutolayoutManager {
    // (...)
}
```

### Step 3

Implemment `tableView(_:heightForRowAtIndexPath:)` as below.

```swift
extension ViewController: UITableViewDelegate {
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return self.tableViewAutolayoutManager(tableView, heightForRowAtIndexPath: indexPath)
    }

    // (...)
}
```

That's all!

## License

TableViewAutolayoutManager is available under the MIT license. See the LICENSE file for more info.
