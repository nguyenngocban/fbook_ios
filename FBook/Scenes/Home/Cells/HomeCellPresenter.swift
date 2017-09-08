//
//  HomeCellPresenter.swift
//  FBook
//
//  Created by Ban Nguyen Ngoc on 9/8/17.
//  Copyright (c) 2017 Framgia. All rights reserved.
//

import UIKit

protocol HomeCellView: class {
    func displayConfigure(_ configurator: HomeCellConfigurator?)
    func refreshBooks()
}

protocol HomeCellPresenter {
    func loadCell()
}

struct HomeCellPresenterImplementation {

    fileprivate weak var view: HomeCellView?
    fileprivate var books: [Book] = []

    init(view: HomeCellView?, books: [Book]) {
        self.view = view
        self.books = books
    }

}

extension HomeCellPresenterImplementation: HomeCellPresenter {
    func loadCell() {
        view?.refreshBooks()
    }
}
