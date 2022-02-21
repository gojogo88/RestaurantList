//
//  RestaurantService.swift
//  RestaurantList
//
//  Created by Jonathan Go on 21.02.22.
//

import Foundation
import RxSwift

class RestaurantService {
    func fetchRestaurants() -> Observable<[Restaurant]> {
        return Observable.create { observer -> Disposable in
            guard let path = Bundle.main.path(forResource: "restaurants", ofType: "json") else {
                observer.onError(NSError(domain: "", code: -1, userInfo: nil))
                return Disposables.create { }
            }
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let restuarants = try JSONDecoder().decode([Restaurant].self, from: data)
                
                observer.onNext(restuarants)
                
            } catch {
                observer.onError(error)
            }
            
            return Disposables.create { }
        }
    }
    
    func fetchRestaurantsfromUrl(url: URL) -> Observable<[Restaurant]> {
        return Observable.create { observer -> Disposable in
            let task = URLSession.shared.dataTask(with: url) { data, _, _ in
                guard let data = data else {
                    observer.onError(NSError(domain: "", code: -1, userInfo: nil))
                    return
                }
                do {
                    let restuarants = try JSONDecoder().decode([Restaurant].self, from: data)
                    observer.onNext(restuarants)
                    
                } catch {
                    observer.onError(error)
                }
            }
            task.resume()
            
            return Disposables.create {
                task.cancel()
            }
        }
    }
}
