//
//  MenuSettingViewController.swift
//  FBook
//
//  Created by Ban Nguyen Ngoc on 9/12/17.
//  Copyright © 2017 Framgia. All rights reserved.
//

import UIKit

class MenuSettingViewController: UIViewController {

    var presenter: MenuSettingPresenter?
    var configurator: MenuSettingConfigurator?

    override func viewDidLoad() {
        super.viewDidLoad()
        configurator?.configure(self)
    }

    @IBAction fileprivate func feedbackButtonTapped(_ sender: Any) {
        presenter?.didSelectFeedback()
    }

    @IBAction fileprivate func moreToolsButtonTapped(_ sender: Any) {
        presenter?.didSelectMoreTools()
    }

    @IBAction fileprivate func workspaceButtonTapped(_ sender: Any) {
        presenter?.didSelectWorkspace()
    }

    @IBAction fileprivate func dismissButtonTapped(_ sender: Any) {
        presenter?.didSelectDismiss()
    }

}

extension MenuSettingViewController: MenuSettingView {
}
