//
//  ImageCache.swift
//  EBuyBooks
//
//  Created by Ramesh kumar penta on 12/07/21.
//

import Foundation
import SwiftUI


class ImageCache {
    private init() {}
    open class var shared : ImageCache {
        get { return ImageCache()}
    }
    var cache : NSCache<NSString,UIImage>?
    
    func getCachedImage(forKey : NSString) -> UIImage? {
        return cache?.object(forKey: forKey)
    }
    
    func set(forKey : NSString, image : UIImage) {
        cache?.setObject(image, forKey: forKey)
    }
}

protocol Cache {
    func add(forKey :String, value : Any)
    func getValue(forKey:String) -> Any
    func remove(forKey :String)
}
class AppCache : Cache {
    
    class var shared : AppCache {
        get {return AppCache()}
    }
    var cache : Dictionary<String,Any> = [:]
    
    func add(forKey : String, value : Any){
        cache[forKey] = value
    }
    func getValue(forKey : String) ->  Any {
        return cache[forKey] ?? ""
        
    }
    
    func remove(forKey : String) {
        cache.removeValue(forKey: forKey)
    }
    
    
}
