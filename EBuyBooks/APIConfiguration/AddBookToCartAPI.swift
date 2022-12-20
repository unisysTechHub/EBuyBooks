//
//  AddBookToCartAPI.swift
//  EBuyBooks
//
//  Created by Ramesh kumar penta on 07/03/21.
//

import Foundation
let addBookToCarturl = "https://2avoi4309a.execute-api.us-east-1.amazonaws.com/default/EBuyAddBooKToCart"
var addBookToCartRequestBody = [
    
      "userName": "EBuyUser1"
    ] as [String : Any]
let addBookToCartUrlRequest =  {(url :String) throws -> URLRequest in
    guard let url = URL(string: url) else {
        throw NetworkError.badURL
    }

    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = "POST"
    urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
    urlRequest.addValue("BXAN1um5SEaPDKnYS48Lt52ENAaytDIj3zuyUYEd", forHTTPHeaderField: "x-api-key")
    urlRequest.httpBody = try! JSONSerialization.data(withJSONObject: addBookToCartRequestBody)
    return urlRequest

}

class EBuyAddToCartRequest :NSObject,EBuyBaseRequest {
    var username : String?
    func encode(to encoder: Encoder) throws {
    }
}
