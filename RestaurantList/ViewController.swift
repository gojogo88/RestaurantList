//
//  ViewController.swift
//  RestaurantList
//
//  Created by Jonathan Go on 21.02.22.
//

import UIKit
import RxSwift

class ViewController: UIViewController {

    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        let service = RestaurantService()
        
        service.fetchRestaurants().subscribe(onNext: { restaurants in
            print(restaurants)
        }).disposed(by: disposeBag)

    }


}

