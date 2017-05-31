//
//  APIURL.swift
//  FBook
//
//  Created by admin on 5/24/17.
//  Copyright © 2017 Framgia. All rights reserved.
//

import UIKit

struct APIURL {
    
    static let base = "http://api-book.framgia.vn/api/v0"
    
    // BOOK
    static let getHomePage = base + "/home"
    static let getBooks = base + "/books"
    
    // USER
    static let login = base + "/login"
    static let register = base + "/register"
}
