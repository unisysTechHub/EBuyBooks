//
//  Book.swift
//  EBuyBooks
//
//  Created by Ramesh kumar penta on 05/03/21.
//

import Foundation

class Book : Decodable,Identifiable
{
    var bookId :String? = "B0001"
    var title : String? = "SWift programming"
    var author : String? = "Jhont"
    var yearOfPublish : Int? = 2000
    var genre : String? = "Technolgoy"
    var price : Double? = 1000.00
    var country : String? = "U.S"
    enum  CodingKeys : String, CodingKey {
        case bookId = "Book_Id"
        case title  = "Title"
        case author = "Author"
        case price = "Price"
        case yearOfPublish = "YearOfPublish"
        case country =  "Country"
        case genre = "Genre"
    }
    
}

//@dynamicMemberLookup
class BooksListResponseModel: Decodable  {
    var statusCode : Int?
    var booksList : [Book]?
//    var lastEvaluatedKey : LastEvaluatedKey?
//    subscript<T>(dynamicMember member: KeyPath<LastEvaluatedKey, T>) -> T {
//        get { return lastEvaluatedKey![keyPath: member] }
//    }
}

class LastEvaluatedKey : Decodable {
    var bookId : String?
    
    enum CodingKeys : String,CodingKey {
        case bookId = "Book_Id"
    }
}
