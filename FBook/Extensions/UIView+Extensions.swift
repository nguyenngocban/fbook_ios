//
//  UIView+Extensions.swift
//  FBook
//
//  Created by Ban Nguyen Ngoc on 9/11/17.
//  Copyright © 2017 Framgia. All rights reserved.
//

import Foundation
import UIKit

extension UIView {

    @discardableResult public func loadViewFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        guard let nibView = nib.instantiate(withOwner: self, options: nil).first as? UIView else {
            return nil
        }
        addSubview(nibView)
        nibView.boundsToSuperView()
        return nibView
    }

    public func boundsToSuperView() {
        if let superView = self.superview {
            frame = superView.bounds
            autoresizingMask = [.flexibleWidth, .flexibleHeight]
            translatesAutoresizingMaskIntoConstraints = true
        }
    }

}