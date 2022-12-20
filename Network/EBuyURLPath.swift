//
//  EBuyURLPath.swift
//  EBuyBooks
//
//  Created by Ramesh kumar penta on 18/09/21.
//

import Foundation

struct EBuyURL{
    let  networkProtocol = "https://"
    let baseURL =  "\(Bundle.main.object(forInfoDictionaryKey: "AppBaseURL") as? String ?? "")"
    class Resource {
        var of = {(api : APIRequest) -> String in
            switch api {
            case .addToCart:
                return "EBuyAddTOcart"
            default:
                return "default"
            }
        }
    } 
    enum APIRequest {
        case addToCart
        case cartItems
        case booksList
     }
    enum APIUUID : String {
        case addToCart = "2avoi4309a"
        case cartItems = "dfdfdfdf"
        case booksList = "dfdfd"
    }

    func path(for api : APIRequest) -> String {
        switch api
        {
        case .addToCart:
            return buildURLPath(appUUID: APIUUID.addToCart.rawValue,api: .addToCart)
        case .cartItems:
            return buildURLPath(appUUID: APIUUID.cartItems.rawValue, api: .cartItems)
        case .booksList:
            return buildURLPath(appUUID: APIUUID.booksList.rawValue,api: .booksList)
        @unknown default :
            print("default Url")
        }
    }
    func buildURLPath(appUUID : String,api : APIRequest) -> String{
        return "\(networkProtocol)\(appUUID).\(baseURL) \\\(Resource().of(api))"
    }
}


