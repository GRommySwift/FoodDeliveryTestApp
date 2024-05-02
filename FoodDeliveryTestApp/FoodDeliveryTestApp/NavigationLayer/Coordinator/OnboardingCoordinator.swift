//
//  OnboardingCoordinator.swift
//  FoodDeliveryTestApp
//
//  Created by Roman on 01/05/2024.
//

import UIKit

class OnboardingCoordinator: Coordinator {
    
    override func start() {
        showOnboarding()
    }
    
    override func finish() {
        finishDelegate?.coordinatorDidFinish(childCoordinator: self)
    }

}
private extension OnboardingCoordinator {
    
    func showOnboarding() {
        var pages = [OnboardingPartViewController]()
        
        let firstVC = OnboardingPartViewController()
        firstVC.imageToShow = UIImage(named: "chicken-leg")!
        firstVC.titleText = "Delicious Food"
        firstVC.descriptionText = "Lorem shoto otam po prikolu pishu but dont know"
        firstVC.buttonText = "Next1"
        
        let secondVC = OnboardingPartViewController()
        secondVC.imageToShow = UIImage(named: "shipped")!
        secondVC.titleText = "Fast Shipping"
        secondVC.descriptionText = "Lorem shoto otam po prikolu pishu but dont know"
        secondVC.buttonText = "Next2"
        
        let thirdVC = OnboardingPartViewController()
        thirdVC.imageToShow = UIImage(named: "medal")!
        thirdVC.titleText = "Certificate Food"
        thirdVC.descriptionText = "Lorem shoto otam po prikolu pishu but dont know"
        thirdVC.buttonText = "Next3"
        
        let fourthVC = OnboardingPartViewController()
        fourthVC.imageToShow = UIImage(named: "credit-card")!
        fourthVC.titleText = "Payment Online"
        fourthVC.descriptionText = "Lorem shoto otam po prikolu pishu but dont know"
        fourthVC.buttonText = "Coool"
        
        pages.append(firstVC)
        pages.append(secondVC)
        pages.append(thirdVC)
        pages.append(fourthVC)
        let presenter = OnboardingViewPresenter(coordinator: self)
        let viewController = OnboardingViewController(pages: pages, viewOutput: presenter)
        navigationController?.pushViewController(viewController, animated: true)
        
    }
}
