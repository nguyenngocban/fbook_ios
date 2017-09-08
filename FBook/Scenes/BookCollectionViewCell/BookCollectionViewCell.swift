//
//  BookCollectionViewCell.swift
//  FBook
//
//  Created by Ban Nguyen Ngoc on 9/8/17.
//  Copyright © 2017 Framgia. All rights reserved.
//

import UIKit
import Kingfisher

class BookCollectionViewCell: UICollectionViewCell {
    
    var presenter: BookCellPresenter?
    var configurator: BookCellConfigurator?

    @IBOutlet fileprivate weak var nameLabel: UILabel?
    @IBOutlet fileprivate weak var thumbnailImageView: UIImageView?
    @IBOutlet fileprivate weak var totalViewLabel: UILabel?
    @IBOutlet fileprivate weak var starLabel: UILabel?

}

extension BookCollectionViewCell: BookCellView {

    func displayConfigure(_ configure: BookCellConfigurator) {
        configurator?.configure(cell: self)
        presenter?.loadBook()
    }

    func displayStar(_ star: Double) {
        starLabel?.text = String(format: "%.02", star)
    }

    func displayTitle(_ title: String) {
        nameLabel?.text = title
    }

    func displayTotalView(_ totalView: Int) {
        totalViewLabel?.text = totalView.description
    }
    
    func displayImage(_ imageUrl: String) {
    }

}
