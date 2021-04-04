//
//  AddToCart.swift
//  EBuyBooks
//
//  Created by Ramesh kumar penta on 07/03/21.
//

import Foundation

class AddBooKToCartResponse :BaseResponse {
    override var statusCode : Int?{
        didSet {
            super.statusCode = statusCode
        }
    }
    var message : String?
    var cartItems : [Book]?
    enum CodingKeys : String,CodingKey {
        case statusCode = "StatusCode"
    }
    
}
