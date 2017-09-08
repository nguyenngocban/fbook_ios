//
//  HomeViewController.swift
//  FBook
//
//  Created by Ban Nguyen Ngoc on 9/8/17.
//  Copyright (c) 2017 Framgia. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {

    @IBOutlet fileprivate weak var tableView: UITableView?

    var homePresenter: HomePresenter!
    var homeConfigurator: HomeConfigurator?

    override func viewDidLoad() {
        super.viewDidLoad()
        homeConfigurator = HomeConfiguratorImplementation()
        homeConfigurator?.configure(viewController: self)
        homePresenter.viewDidLoad()
    }

}

extension HomeViewController: HomeView {

    func refreshBooks() {
        tableView?.reloadData()
    }

    func showLoadBooksError(message: String) {
        Utility.shared.showMessage(message: message, completion: nil)
    }

}

extension HomeViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return homePresenter.numberOfSectionBooks
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homePresenter.numberOfRowInSectionBooks
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ni = UINib(nibName: "HomeTableViewCell", bundle: nil)
        tableView.register(ni, forCellReuseIdentifier: "ni")
        let cell = tableView.dequeueReusableCell(withIdentifier: "ni") as? HomeTableViewCell ?? HomeTableViewCell()
        homePresenter.configure(cell: cell, indexPath: indexPath)
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return homePresenter.heightForRow
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return homePresenter.heightForHeader
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let ni = UINib(nibName: "HomeHeaderViewCell", bundle: nil)
        tableView.register(ni, forCellReuseIdentifier: "ni")
        let header = tableView.dequeueReusableCell(withIdentifier: "ni") as? HomeHeaderViewCell ?? HomeHeaderViewCell()
        homePresenter.configureHeader(header: header, section: section)
        return header.contentView
    }

}
