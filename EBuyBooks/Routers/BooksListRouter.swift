//
//  BooksListRouter.swift
//  EBuyBooks
//
//  Created by Ramesh kumar penta on 03/12/21.
//

import Foundation
import SwiftUI


class BooksListRouter {
    func makeBookDetailsview(book : Book) -> some View {
        return BookDetailsView(bookModel: book)
    }
}
