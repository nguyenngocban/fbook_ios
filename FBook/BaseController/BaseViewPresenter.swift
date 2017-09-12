//
//  BaseViewPresenter.swift
//  FBook
//
//  Created by Ban Nguyen Ngoc on 9/12/17.
//  Copyright © 2017 Framgia. All rights reserved.
//

import Foundation

protocol BaseView: class {

}

protocol BasePresenter {
    func menuButtonTapped()
    func workspaceButtonTapped()
    func backButtonTapped()
}

class BasePresenterImplementation {

    fileprivate weak var view: BaseView?
    fileprivate let router: BaseViewRouter?

    init(view: BaseView?, router: BaseViewRouter?) {
        self.view = view
        self.router = router
    }

}

extension BasePresenterImplementation: BasePresenter {

    func menuButtonTapped() {
        router?.showMenuSetting(delegate: self)
    }

    func workspaceButtonTapped() {
        router?.showWorkspace()
    }

    func backButtonTapped() {
        router?.backViewController()
    }

}

extension BasePresenterImplementation: MenuSettingPresenterDelegate {

    func didSelectFeedback() {
        router?.showFeedback()
    }

    func didSelectMoreTools() {
        router?.showMoreTools()
    }

    func didSelectWorkspace() {
        router?.showWorkspace()
    }

}
