//
//  HomeCellConfigurator.swift
//  FBook
//
//  Created by Ban Nguyen Ngoc on 9/8/17.
//  Copyright (c) 2017 Framgia. All rights reserved.
//

import UIKit

protocol HomeCellConfigurator {
    func configure(cell: HomeTableViewCell)
}

struct HomeCellConfiguratorImplementation {

    fileprivate var books: [Book] = []

    init(books: [Book]) {
        self.books = books
    }

}

extension HomeCellConfiguratorImplementation: HomeCellConfigurator {

    func configure(cell: HomeTableViewCell) {
        let presenter = HomeCellPresenterImplementation(view: cell, books: books)
        cell.presenter = presenter
    }

}
