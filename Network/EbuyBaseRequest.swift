//
//  EbuyBaseRequest.swift
//  EBuyBooks
//
//  Created by Ramesh kumar penta on 18/09/21.
//

import Foundation

protocol EBuyBaseRequest : Encodable {}
extension EBuyBaseRequest {
    public func asDictionary() -> [String : Any]
    {
        guard let data = try? JSONEncoder().encode(self) else {
            return [:]
        }
        
        guard let dictionary = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String:Any] else {
            return [:]
        }
        
        return dictionary
        
    }
}
