//
//  APIExecutors.swift
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
let booksListurl = ""
let booksListRequestBody = ["searchString": "",
"maxItems": 2,
"LastEvaluatedKey": [
  "Book_Id": "B1001"
]
] as [String : Any]
let bookListUrlRequest =  {(url :String) throws -> URLRequest in
    guard let url = URL(string: url) else {
        throw NetworkError.badURL
    }

    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = "POST"
    urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
    urlRequest.addValue("String", forHTTPHeaderField: "api-key")
    urlRequest.httpBody = try! JSONSerialization.data(withJSONObject: booksListRequestBody, options: .prettyPrinted)
    return urlRequest

}

    


func executeAPI<T:Decodable>(for url : String, for urlRequest : (String) throws -> URLRequest, model : T.Type) -> Future<T,NetworkError>
{
    return Future(){ prmomise in
        
        do {
            
         let urlRequest =  try urlRequest(url)
            URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
             guard let httpResponse = response as? HTTPURLResponse,
                 httpResponse.statusCode == 200 else {
                prmomise(Result.failure(NetworkError.serverError))
                return
                 }
            
            guard let responseData = data  else {
                return
            }
            
            do {
                let model = try JSONDecoder().decode(  model.self, from:  responseData)
                  prmomise(Result.success(model))
                
            }catch {
                prmomise(Result.failure(NetworkError.decodeError))
            }
             
            }.resume()
        }catch {
            prmomise(Result.failure(NetworkError.badURL))

        }
        

        
    }
}

