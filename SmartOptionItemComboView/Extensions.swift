//
//  Extensions.swift
//  SmartOptionItemComboView
//
//  Created by Zhengqian Kuang on 2019-03-28.
//  Copyright © 2019 Home. All rights reserved.
//

import UIKit

public extension UIView {
    public func setBorder(width: CGFloat, color: UIColor?, radius: CGFloat) {
        self.layer.borderWidth = width
        if color != nil {
            self.layer.borderColor = color?.cgColor
        }
        self.makeRoundCorner(radius: radius)
    }
    
    func makeRoundCorner(radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
}
