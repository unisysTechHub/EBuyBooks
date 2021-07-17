//
//  ImageCache.swift
//  EBuyBooks
//
//  Created by Ramesh kumar penta on 12/07/21.
//

import Foundation
import SwiftUI


class ImageCache {
    var cache : NSCache<NSString,UIImage>?
    
    func getCachedImage(forKey : NSString) -> UIImage? {
        return cache?.object(forKey: forKey)
    }
    
    func set(forKey : NSString, image : UIImage) {
        cache?.setObject(image, forKey: forKey)
    }
}
