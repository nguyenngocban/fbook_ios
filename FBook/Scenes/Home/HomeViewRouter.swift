//
//  HomeViewRouter.swift
//  FBook
//
//  Created by Ban Nguyen Ngoc on 9/8/17.
//  Copyright (c) 2017 Framgia. All rights reserved.
//

import UIKit

protocol HomeViewRouter {

}

struct HomeViewRouterImplementation {

    fileprivate weak var viewController: HomeViewController?

    init(viewController: HomeViewController?) {
        self.viewController = viewController
    }

}

extension HomeViewRouterImplementation: HomeViewRouter {

}
