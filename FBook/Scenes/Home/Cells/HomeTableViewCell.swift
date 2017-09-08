//
//  HomeTableViewCell.swift
//  FBook
//
//  Created by Ban Nguyen Ngoc on 9/8/17.
//  Copyright © 2017 Framgia. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet fileprivate weak var collectionView: UICollectionView?

    var presenter: HomeCellPresenter?
    var configurator: HomeCellConfigurator?

}

extension HomeTableViewCell: HomeCellView {

    func refreshBooks() {
        collectionView?.reloadData()
    }

    func displayConfigure(_ configurator: HomeCellConfigurator?) {
        self.configurator = configurator
        self.configurator?.configure(cell: self)
    }

}

//extension HomeTableViewCell: UICollectionViewDelegateFlowLayout {
//    
//}
//
//extension HomeTableViewCell: UICollectionViewDataSource {
//    
//    
//    
//}
