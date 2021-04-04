//
//  AddToCartViewModel.swift
//  EBuyBooks
//
//  Created by Ramesh kumar penta on 07/03/21.
//

import Foundation
import Combine
class AddToCartViewModel : ObservableObject {
  @Published  var cartItems : [Book] = [Book]()
    var cancellables = Set<AnyCancellable>()
    
    func apiNetworkRequest(book : Book) {
        
        DispatchQueue.global(qos: .userInitiated).async {
            let requestBookObject = ["Author": book.author!,
                                     "Book_Id": book.bookId!,
                                     "Country": book.country!,
                                     "Title": book.title!,
                                     "Price": book.price!,
                                      "Genre": book.genre!,
                                      "YearOfPublish": book.yearOfPublish!] as [String : Any]
            print(requestBookObject["Author"] ?? "default author")
            addBookToCartRequestBody["newitem"] = requestBookObject
            executeAPI(url: addBookToCarturl, urlRequest: addBookToCartUrlRequest, model: AddBooKToCartResponse.self).receive(on: DispatchQueue.main).sink { (requestStaus) in
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
}

