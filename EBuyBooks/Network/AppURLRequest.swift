//
//  AppURLRequest.swift
//  EBuyBooks
//
//  Created by Ramesh kumar penta on 09/02/22.
//

import Foundation
import Foundation
//let addBookToCarturl = "https://2avoi4309a.execute-api.us-east-1.amazonaws.com/default/EBuyAddBooKToCart"
class Url {
  private static  let baseURL = "execute-api.us-east-1.amazonaws.com/default"
 private static let addBookCartURL = "https://2avoi4309a." + baseURL + "/EBuyAddBooKToCart"
   static func addBookToCartAPI() -> URL  {
    return URL(string: addBookCartURL)!  }
}
enum Endpoint {
    case addBookTocart
}

protocol BaseHeaders {
}
extension BaseHeaders {
    static func baseHeaders() -> [String:String] {
        var baseHeaders : [String:String] = [:]
         baseHeaders["Content-Type" ] = "application/json"
         baseHeaders["Authorization"] = jwtToken
        return baseHeaders
     }
}
fileprivate class APIHeadersBuilder :BaseHeaders {
    static var resourceHeaders : (Endpoint,inout URLRequest) -> URLRequest = { (endpint,urlrequest) in
        switch endpint {
        case .addBookTocart:
            addBookToCart(urlrequest: &urlrequest)
        
        }
        return urlrequest
    }
  private static func addBookToCart(urlrequest : inout URLRequest) {
        addBaseHeaders(urlRequest: &urlrequest)
        addAPIKeyHeaders(endpint: Endpoint.addBookTocart, urlRequest: &urlrequest)
    }
    
  private  static func addAPIKeyHeaders(endpint : Endpoint, urlRequest : inout URLRequest) {
        
        switch endpint {
        case .addBookTocart:
            urlRequest.addValue("dyY5rcBrf06XLhhdNRehE3Oj5Bh1G7ysaUNqdBOe", forHTTPHeaderField: "x-api-key")
        default:
            print("API end point not exists")
        }
    }
    
    
    private static func addBaseHeaders(urlRequest : inout URLRequest) {
        baseHeaders().forEach { (key: String, value: String) in
            urlRequest.addValue(value, forHTTPHeaderField: key)
        }
    }
}
class URLRequestBuilder {
    static var instance = {URLRequestBuilder()}()
    var urlRequest : URLRequest?
    func addBookToCart(requestParams : [String:Any]) -> URLRequest {
        self.urlRequest = URLRequest(url: Url.addBookToCartAPI())
        addHeaders(endpoint: .addBookTocart)
        addRequestBody(requestParams: requestParams)
        return urlRequest!
    }
    
    func addRequestBody(requestParams : [String:Any]) {
        self.urlRequest?.httpBody = try! JSONSerialization.data(withJSONObject: requestParams)
    }
    func addHeaders(endpoint : Endpoint) {
        APIHeadersBuilder.resourceHeaders(endpoint,&urlRequest!)
    }
}
