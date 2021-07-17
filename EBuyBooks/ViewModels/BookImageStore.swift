//
//  BookDetailsViewModel.swift
//  EBuyBooks
//
//  Created by Ramesh kumar penta on 12/07/21.
//

import Combine
import SwiftUI
import Amplify
class BookImageStore : ObservableObject
{
    @Published var bookImage : UIImage? = UIImage(named: "swiftbookimage")
    var cancellables  = Set<AnyCancellable>()
    var imageCache = ImageCache()
    func loadImage(s3ObejctKey : String) {
        //store in a file or cache
        guard let cachedImage = imageCache.getCachedImage(forKey:  NSString("s3ObejctKey"))  else {
            downloadImageFromS3()
        
            return
        }
        
        self.bookImage = cachedImage

    }
    
    func downloadImageFromS3()
    {
        let storageOperation = Amplify.Storage.downloadData(key: "books/B1001_Image.jpeg")
        _ = storageOperation.progressPublisher.sink { progress in print("Progress: \(progress)") }.store(in: &self.cancellables)
        storageOperation.resultPublisher.subscribe(on: DispatchQueue.global(qos: .background)).receive(on: DispatchQueue.main).sink {
                    if case let .failure(storageError) = $0 {
                        print("Failed: \(storageError.errorDescription). \(storageError.recoverySuggestion)")
                    }
                }
                receiveValue: { data in
                    print("Ramesh file dowlaoded")
                    self.bookImage = UIImage(data: data)
        
                }.store(in: &self.cancellables)
    }
}
