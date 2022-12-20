//
//  Util.swift
//  EBuyBooks
//
//  Created by Ramesh kumar penta on 09/02/22.
//

import Foundation
class NetworkUtil {
    
   static func  buildMethodRequestBodyModel(book: Book) -> [String:Any] {
        let requestBookObject = ["Author": book.author!,
                                 "Book_Id": book.bookId!,
                                 "Country": book.country!,
                                 "Title": book.title!,
                                 "Price": book.price!,
                                  "Genre": book.genre!,
                                  "YearOfPublish": book.yearOfPublish!] as [String : Any]
    var requestBody : [String:Any] = [:]
    requestBody["newitem"] = requestBookObject
        return requestBody

    }
}
