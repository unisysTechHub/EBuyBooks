//
//  EBuyBooks
//
//  Created by Ramesh kumar penta on 05/03/21.
//

import Foundation
import Combine
enum NetworkError : Error {
    case badURL
    case decodeError
    case serverError
}
let booksListurl = "https://w41v53pmwj.execute-api.us-east-1.amazonaws.com/default/EBuyBooksList"

let booksListRequestBody = [
    "searchString": "",
    "maxItems": 100] as [String : Any]
let booksListUrlRequest =  {(url :String) throws -> URLRequest in
    guard let url = URL(string: url) else {
        throw NetworkError.badURL
    }

    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = "POST"
    urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
    urlRequest.addValue("dyY5rcBrf06XLhhdNRehE3Oj5Bh1G7ysaUNqdBOe", forHTTPHeaderField: "x-api-key")
    urlRequest.addValue(jwtToken, forHTTPHeaderField: "Authorization")
    urlRequest.httpBody = try! JSONSerialization.data(withJSONObject: booksListRequestBody)
    return urlRequest

}

    


