//
//  CacheService.swift
//  AvitoTest
//
//  Created by Andrey on 28.08.2021.
//

import Foundation

protocol Cache: AnyObject {
    func fetchData<M>(_ type: M.Type) -> M?
    func setDataCache<M>(data: M)
}

class CacheService: Cache {
    // MARK: - Private Properties
    private var dataCache = NSCache<AnyObject, AnyObject>()
    private var date: Date = Date()
    
    // MARK: - Fetch Data
    func fetchData<M>(_ type: M.Type) -> M? {
        if let dataCache = self.dataCache.object(forKey: "response" as AnyObject) {
            if (date.minutes() < Constants.cacheDelayInMinutes) {
                return dataCache as? M
            } else {
                return nil
            }
        } else {
            return nil
        }
    }
    
    // MARK: - Set Data Cache
    func setDataCache<M>(data: M) {
        dataCache.setObject(data as AnyObject, forKey: "response" as AnyObject)
    }
}
