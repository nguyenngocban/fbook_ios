//
//  BookCellPresenter.swift
//  FBook
//
//  Created by Ban Nguyen Ngoc on 9/8/17.
//  Copyright © 2017 Framgia. All rights reserved.
//

import Foundation

protocol BookCellView: class {
    func displayConfigure(_ configure: BookCellConfigurator)
    func displayTitle(_ title: String)
    func displayImage(_ imageUrl: String)
    func displayTotalView(_ totalView: Int)
    func displayStar(_ star: Double)
}

protocol BookCellPresenter {
    func loadBook()
}

struct BookCellPresenterImplementation {

    fileprivate weak var view: BookCellView?
    fileprivate var book: Book

    init(view: BookCellView?, book: Book) {
        self.view = view
        self.book = book
    }

}

extension BookCellPresenterImplementation: BookCellPresenter {
    func loadBook() {
        view?.displayStar(book.averageStar)
        view?.displayImage(book.thumbnail ?? "")
        view?.displayTitle(book.title)
        view?.displayTotalView(book.totalView)
    }
}
