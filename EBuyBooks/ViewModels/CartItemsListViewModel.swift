//
//  CartItemsListViewModel.swift
//  EBuyBooks
//
//  Created by Ramesh kumar penta on 08/03/21.
//

import Foundation
import Combine

class CartItemsListViewModel : ObservableObject
{
  @Published  var carItems :[Book] = [Book(),Book()]
  @Published var showProgressBar : Bool = true
  @Published var error : String? = nil
  @Published var cartTotalAmount : Double = 0.0

  var cancellables = Set<AnyCancellable>()
    func apiNetworRequest() {
                 self.showProgressBar = false

        executeAPI(url: cartItemsListurl, urlRequest: cartItemsListUrlRequest, model: CartItemsListResponse.self) .receive(on: DispatchQueue.main).sink { (requestStaus) in
            switch(requestStaus) {
            case .failure(let error) :
                self.error = error.localizedDescription
            case .finished :
               print("cart items list network request successful")
            }
        } receiveValue: { cartItemsListResponseModel in
            if let cartItems = cartItemsListResponseModel.cartItems {
                self.carItems = cartItems
                self.cartTotalAmount =   self.carItems.reduce(0.0) { (result, book)  in
                    return result + book.price!
                }
            }

            self.showProgressBar = false
        }.store(in: &cancellables)

    }

}
