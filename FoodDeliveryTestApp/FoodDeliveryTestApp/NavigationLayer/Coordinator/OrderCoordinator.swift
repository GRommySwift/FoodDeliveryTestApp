//
//  OrderCoordinator.swift
//  FoodDeliveryTestApp
//
//  Created by Roman on 01/05/2024.
//

import UIKit

class OrderCoordinator: Coordinator {
    
    override func start() {
        let vc = ViewController()
        vc.view.backgroundColor = .yellow
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func finish() {
        print("AppCoordinator finished")
    }

}

