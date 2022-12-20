//
//  BooksListViewModel.swift
//  EBuyBooks
//
//  Created by Ramesh kumar penta on 05/03/21.
//

import Foundation
import SwiftUI
import Combine

class BookListViewModel : ObservableObject
{
    @Published var booksList : [Book] = [Book(),Book()]
    @Published var error : String? = nil
    @Published var showProgressBar : Bool = true
    var cancellables = Set<AnyCancellable>()

    func apiNetworRequest() {
        #warning("test warning message")
       
                // self.showProgressBar = false
        
        executeAPI(url: booksListurl, urlRequest: booksListUrlRequest, model: BooksListResponseModel.self) .receive(on: DispatchQueue.main).sink { (requestStaus) in
            self.showProgressBar = false

            switch(requestStaus) {
            case .failure(let error) :
                self.error = error.localizedDescription
            case .finished :
               print("network request successful")
            }
        } receiveValue: { booksListResponseModel in
            print("Receive value")
            if let booksList = booksListResponseModel.booksList {
                print("Receive value")

                self.booksList = booksList
            }

            self.showProgressBar = false
        }.store(in: &cancellables)

    }
}
