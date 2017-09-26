//
//  SearchViewRouter.swift
//  FBook
//
//  Created by Huy Pham on 9/8/17.
//  Copyright © 2017 Framgia. All rights reserved.
//

import UIKit

protocol SearchViewRouter {

    func showDetail(book: Book)
}

class SearchViewRouterImplementation {

    fileprivate var viewController: SearchViewController?

    init(viewController: SearchViewController) {
        self.viewController = viewController
    }
}

extension SearchViewRouterImplementation: SearchViewRouter {

    func showDetail(book: Book) {
        guard let detailViewController = UIStoryboard.bookDetail.instantiateInitialViewController()
                as? BookDetailViewController else {
            return
        }
        detailViewController.configurator = BookDetailConfiguratorImplementation(book: book)
        viewController?.navigationController?.pushViewController(detailViewController, animated: true)
    }
}
