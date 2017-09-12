//
//  BaseViewRouter.swift
//  FBook
//
//  Created by Ban Nguyen Ngoc on 9/12/17.
//  Copyright © 2017 Framgia. All rights reserved.
//

import Foundation

protocol BaseViewRouter {
    func showMenuSetting(delegate: MenuSettingPresenterDelegate)
    func showWorkspace()
    func backViewController()
    func showFeedback()
    func showMoreTools()
}

struct BaseViewRouterImplementation {

    fileprivate weak var view: BaseViewController?

    init(view: BaseViewController?) {
        self.view = view
    }

}

extension BaseViewRouterImplementation: BaseViewRouter {

    func showMenuSetting(delegate: MenuSettingPresenterDelegate) {
        let menu = MenuSettingViewController(nibName: "MenuSettingViewController", bundle: nil)
        menu.modalPresentationStyle = .overFullScreen
        let configurator = MenuConfiguratorImplementation(delegate: delegate)
        menu.configurator = configurator
        view?.present(menu, animated: false, completion: nil)
    }

    func showWorkspace() {
        // TODO:
    }

    func backViewController() {
        _ = view?.navigationController?.popViewController(animated: true)
    }

    func showFeedback() {
        // TODO:
    }

    func showMoreTools() {
        // TODO:
    }

}
