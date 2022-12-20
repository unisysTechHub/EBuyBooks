//
//  EBuybooksAPI.swift
//  EBuyBooks
//
//  Created by Ramesh kumar penta on 09/02/22.
//

import Foundation
import Combine
protocol EbuyBookDataSource {
    func addBookToCart(requestParams:[String:Any]) -> Future<AddBooKToCartResponse,NetworkError>
}
