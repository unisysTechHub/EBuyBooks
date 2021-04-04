//
//  CartItemsListAPI.swift
//  EBuyBooks
//
//  Created by Ramesh kumar penta on 09/03/21.
//

import Foundation
//
//  EBuyBooks
//
//  Created by Ramesh kumar penta on 05/03/21.
//

import Foundation
import Combine

let cartItemsListurl = "https://y5w1wcqctk.execute-api.us-east-1.amazonaws.com/default/EBuyBooksCart"

let cartItemsListRequestBody = [
    
    "userName": "EBuyUser1"
  ] as [String : Any]
let cartItemsListUrlRequest =  {(url :String) throws -> URLRequest in
    guard let url = URL(string: url) else {
        throw NetworkError.badURL
    }

    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = "POST"
    urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
    urlRequest.addValue("mNjYbqcsbe2ChNN36toRw6peCMSq8tAc88aZ3y88", forHTTPHeaderField: "x-api-key")
    urlRequest.httpBody = try! JSONSerialization.data(withJSONObject: cartItemsListRequestBody)
    return urlRequest

}

    


