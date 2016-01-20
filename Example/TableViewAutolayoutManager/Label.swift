//
//  Label.swift
//  TableViewManager
//
//  Created by Artur Jaworski on 19.01.2016.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit

class Label: UILabel {
    
    override var bounds : CGRect {
        didSet {
            if self.numberOfLines == 0 {
                let boundsWidth = CGRectGetWidth(self.bounds)
                if self.preferredMaxLayoutWidth != boundsWidth {
                    self.preferredMaxLayoutWidth = boundsWidth
                    self.needsUpdateConstraints()
                }
            }
        }
    }

}
