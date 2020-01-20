//
//  BottomBorder.swift
//  shopper
//
//  Created by Chuck Pilon on 1/20/20.
//  Copyright © 2020 Pilon Apps, Inc. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    func addBottomBorder(color: CGColor) {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: self.frame.size.height - 1, width: self.frame.size.width, height: 1)
        bottomLine.backgroundColor = color
        borderStyle = .none
        layer.addSublayer(bottomLine)
    }
}
