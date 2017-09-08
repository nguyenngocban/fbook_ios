//
//  HomeHeaderViewCell.swift
//  FBook
//
//  Created by Ban Nguyen Ngoc on 9/8/17.
//  Copyright © 2017 Framgia. All rights reserved.
//

import UIKit

protocol HomeHeaderView {
    func displayTitle(_ title: String)
}

class HomeHeaderViewCell: UITableViewCell {
    @IBOutlet fileprivate weak var titleLabel: UILabel?
}

extension HomeHeaderViewCell: HomeHeaderView {

    func displayTitle(_ title: String) {
        titleLabel?.text = title
    }

}
