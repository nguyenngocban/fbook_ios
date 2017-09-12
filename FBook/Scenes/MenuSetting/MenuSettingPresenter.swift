//
//  MenuSettingPresenter.swift
//  FBook
//
//  Created by Ban Nguyen Ngoc on 9/12/17.
//  Copyright © 2017 Framgia. All rights reserved.
//

import Foundation

protocol MenuSettingView: class {

}

protocol MenuSettingPresenterDelegate: class {
    func didSelectFeedback()
    func didSelectMoreTools()
    func didSelectWorkspace()
}

protocol MenuSettingPresenter {
    func didSelectDismiss()
    func didSelectFeedback()
    func didSelectMoreTools()
    func didSelectWorkspace()
}

class MenuSettingPresenterImplementation {

    fileprivate weak var view: MenuSettingView?
    fileprivate weak var delegate: MenuSettingPresenterDelegate?
    fileprivate let router: MenuSettingRouter?

    init(view: MenuSettingView?, delegate: MenuSettingPresenterDelegate?, router: MenuSettingRouter?) {
        self.view = view
        self.delegate = delegate
        self.router = router
    }

}

extension MenuSettingPresenterImplementation: MenuSettingPresenter {

    func didSelectDismiss() {
        router?.dismiss()
    }

    func didSelectFeedback() {
        delegate?.didSelectFeedback()
        router?.dismiss()
    }

    func didSelectMoreTools() {
        delegate?.didSelectMoreTools()
        router?.dismiss()
    }

    func didSelectWorkspace() {
        delegate?.didSelectWorkspace()
        router?.dismiss()
    }

}
