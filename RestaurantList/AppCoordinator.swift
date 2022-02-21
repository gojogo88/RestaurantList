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
        
         let viewController = ViewController()
         let viewModel = RestaurantListViewModel()
         viewController.viewModel = viewModel
         let navController = UINavigationController(rootViewController: viewController)
         window.rootViewController = navController
         window.makeKeyAndVisible()
        
    }
}
