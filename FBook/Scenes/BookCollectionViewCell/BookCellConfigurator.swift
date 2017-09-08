//
//  BookCellConfigurator.swift
//  FBook
//
//  Created by Ban Nguyen Ngoc on 9/8/17.
//  Copyright © 2017 Framgia. All rights reserved.
//

import Foundation

protocol BookCellConfigurator {
    func configure(cell: BookCollectionViewCell)
}

struct BookCellConfiguratorImplementation {

    fileprivate var books: Book

    init(books: Book) {
        self.books = books
    }

}

extension BookCellConfiguratorImplementation: BookCellConfigurator {

    func configure(cell: BookCollectionViewCell) {
        let presenter = BookCellPresenterImplementation(view: cell, book: books)
        cell.presenter = presenter
    }

}
