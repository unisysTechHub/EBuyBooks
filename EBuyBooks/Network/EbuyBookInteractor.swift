//
//  EbuyBookInteractor.swift
//  EBuyBooks
//
//  Created by Ramesh kumar penta on 09/02/22.
//

import Foundation
import Combine
class User {
    var userName = "EBuyUser1"
}

class EBuybookRemoeDataInteractor {
    var remoteDataSource : EbuyBookDataSource = EBuyBooksDataRemoteSource.instance
    
//    open class var shared : EBuybookInteractor { get {return EBuybookInteractor()}
//
//    }
//
    func addBookToCart(requestParams : inout [String:Any]) -> Future<AddBooKToCartResponse,NetworkError> {
        requestParams["userName"] = User().userName
       return remoteDataSource.addBookToCart(requestParams: requestParams)
        
    }
    
}
