//
//  OnboardingCoordinator.swift
//  FoodDeliveryTestApp
//
//  Created by Roman on 01/05/2024.
//

import UIKit

class OnboardingCoordinator: Coordinator {
    
    override func start() {
        let vc = ViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func finish() {
        print("AppCoordinator finished")
    }

}
