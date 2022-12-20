//
//  Executor.swift
//  EBuyBooks
//
//  Created by Ramesh kumar penta on 09/02/22.
//

import Foundation
import Combine
func executeAPIModfied<T:Decodable>( urlRequest : URLRequest, model : T.Type) -> Future<T,NetworkError>
{   print("executeAPI")
    return Future(){ promise in
        
        DispatchQueue.global(qos: .userInitiated).async {
            do {
                 print("request bod \(String(data :urlRequest.httpBody!,encoding: .utf8))")
                URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
                 guard let httpResponse = response as? HTTPURLResponse,
                     httpResponse.statusCode == 200 else {
                    promise(Result.failure(NetworkError.serverError))
                    return
                     }

                guard let responseData = data  else {
                    return
                }
                
                do {
                    let dataString = String(data: responseData, encoding: .utf8)
                    print ("got data: \(dataString)")
                    
                    print("before decode \(responseData)"  )
                    let responseModel = try JSONDecoder().decode(  model.self, from:  responseData)
                       
                    promise(Result.success(responseModel))
                    
                }catch let err {
                    print(err)
                    promise(Result.failure(NetworkError.decodeError))
                }
                 
                }.resume()
            }
            
        }
   

        
    }
}

