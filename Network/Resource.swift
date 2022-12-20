//
//  Resource.swift
//  EBuyBooks
//
//  Created by Ramesh kumar penta on 31/01/22.
//

import Foundation
class Resource {
    var resourceToConsume : String
    var httpMethod : String
    var bodyRequest : EBuyBaseRequest
    
    init(resourceToConsume : String, httpMethod : String, bodyRequest : EBuyBaseRequest) {
        self.resourceToConsume  = resourceToConsume
        self.bodyRequest = bodyRequest
        self.httpMethod = httpMethod
        
    }
    
}
enum APIKey  {
    case addToCart
}
class ResourceHeders
{
    var headers : Dictionary<String,String> = [:]
    func baseHeaders() -> Dictionary<String,String> {
        headers["Content-type"] = "application/json"
        headers["Authorization"] = jwtToken
        return headers
    }
    func addToCartAPIHeaders() {}
    }
    
    
    
    
    
    

