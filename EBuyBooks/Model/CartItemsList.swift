//
//  CartItemsList.swift
//  EBuyBooks
//
//  Created by Ramesh kumar penta on 09/03/21.
//

import Foundation
class CartItemsListResponse :BaseResponse{
    override var statusCode : Int?{
        didSet {
            super.statusCode = statusCode
        }
    }
    var cartItems : [Book]?
    
}
