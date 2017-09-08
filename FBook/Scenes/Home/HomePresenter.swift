//
//  HomePresenter.swift
//  FBook
//
//  Created by Ban Nguyen Ngoc on 9/8/17.
//  Copyright (c) 2017 Framgia. All rights reserved.
//

import UIKit

protocol HomeView: class {
    func refreshBooks()
    func showLoadBooksError(message: String)
}

protocol HomePresenter {
    var router: HomeViewRouter? { get }
    func viewDidLoad()
    var numberOfSectionBooks: Int { get }
    var numberOfRowInSectionBooks: Int { get }
    var heightForRow: CGFloat { get }
    var heightForHeader: CGFloat { get }
    func configureHeader(header: HomeHeaderView, section: Int)
    func configure(cell: HomeCellView, indexPath: IndexPath)
}

class HomePresenterImplementation {

    fileprivate weak var view: HomeView?
    private(set) var router: HomeViewRouter?
    fileprivate var sectionBooks: [SectionBook] = []

    init(view: HomeView?, router: HomeViewRouter?) {
        self.view = view
        self.router = router
    }

    fileprivate func handleLoadBookSuccess(_ sectionBooks: [SectionBook]) {
        self.sectionBooks = sectionBooks
        view?.refreshBooks()
    }

    fileprivate func handleLoadBookError(_ error: Error) {
        view?.showLoadBooksError(message: error.message)
    }

}

extension HomePresenterImplementation: HomePresenter {

    func viewDidLoad() {
        AlertHelper.showLoading()
        HomeProvider.getListSectionBook().on(failed: { error in
            AlertHelper.hideLoading()
            self.handleLoadBookError(error)
        }, completed: {
            AlertHelper.hideLoading()
        }, value: { sectionBooks in
            self.handleLoadBookSuccess(sectionBooks)
        }).start()
    }

    var numberOfSectionBooks: Int {
        return sectionBooks.count
    }

    var numberOfRowInSectionBooks: Int {
        return 1
    }

    func configure(cell: HomeCellView, indexPath: IndexPath) {
        let books = sectionBooks[indexPath.section].books ?? []
        let config = HomeCellConfiguratorImplementation(books: books)
        cell.displayConfigure(config)
    }

    var heightForRow: CGFloat {
        return 100.0
    }

    var heightForHeader: CGFloat {
        return 50.0
    }

    func configureHeader(header: HomeHeaderView, section: Int) {
        header.displayTitle(sectionBooks[section].title)
    }

}
