//
//  EBuyBooksDataSource.swift
//  EBuyBooks
//
//  Created by Ramesh kumar penta on 09/02/22.
//

import Foundation
import Combine
class EBuyBooksDataRemoteSource : EbuyBookDataSource {
   static var instance = { EBuyBooksDataRemoteSource()}()
    func addBookToCart(requestParams:[String:Any]) -> Future<AddBooKToCartResponse,NetworkError> {
        return executeAPIModfied(urlRequest: self.buildURLRequest(requestParams),model: AddBooKToCartResponse.self)
    }
    
    var  buildURLRequest : (([String:Any]) -> URLRequest)  = { (requestParams )   in
        let urlrequest = URLRequestBuilder.instance.addBookToCart(requestParams: [:])
        
        return urlrequest
    
    }
    
}
