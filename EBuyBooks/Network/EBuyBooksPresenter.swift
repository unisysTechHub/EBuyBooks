//
//  EBuyBooksPresenter.swift
//  EBuyBooks
//
//  Created by Ramesh kumar penta on 09/02/22.
//

import Foundation
import Combine
enum DataSourceType {
    case API
}
class EBuybooksPresenter {
    @Published  var cartItems : [Book] = [Book]()
      var cancellables = Set<AnyCancellable>()
    
       
    var eBuybooksInteractor  = EBuybookRemoeDataInteractor()
    
    

    func addBookToCart(book : Book) {
           var requstParms =  NetworkUtil.buildMethodRequestBodyModel(book:book)
            print((requstParms["newitem"] as! Dictionary<String,Any>)["Author"] ?? "default author")
            eBuybooksInteractor.addBookToCart(requestParams: &requstParms).receive(on: DispatchQueue.main).sink { (requestStaus) in
                            switch(requestStaus) {
                            case .failure(let error) :
                                print(error.localizedDescription)
                            case .finished :
                               print("addtoCart request successful")
                            }
                        } receiveValue: { addBooKToCartResponseModel in
                            print("Received cart items \(addBooKToCartResponseModel.message)"  )
                            if let cartItems = addBooKToCartResponseModel.cartItems {
                                self.cartItems = cartItems
                                print(cartItems.count)
                            }
                
                        }.store(in: &self.cancellables)
        }
    
    
    
}
