//
//  MenuConfigurator.swift
//  FBook
//
//  Created by Ban Nguyen Ngoc on 9/12/17.
//  Copyright © 2017 Framgia. All rights reserved.
//

import Foundation

protocol MenuSettingConfigurator {
    func configure(_ view: MenuSettingViewController)
}

struct MenuConfiguratorImplementation {

    fileprivate weak var delegate: MenuSettingPresenterDelegate?

    init(delegate: MenuSettingPresenterDelegate?) {
        self.delegate = delegate
    }

}

extension MenuConfiguratorImplementation: MenuSettingConfigurator {

    func configure(_ view: MenuSettingViewController) {
        let router = MenuSettingRouterImplementation(viewController: view)
        let presenter = MenuSettingPresenterImplementation(view: view, delegate: delegate, router: router)
        view.presenter = presenter
    }

}
