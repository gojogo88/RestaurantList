//
//  AppCoordinator.swift
//  RestaurantList
//
//  Created by Jonathan Go on 21.02.22.
//

import Foundation
import UIKit

class AppCoordinator {
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        
         let home = ViewController()
 
         let navController = UINavigationController(rootViewController: home)
         window.rootViewController = navController
         window.makeKeyAndVisible()
        
    }
}
