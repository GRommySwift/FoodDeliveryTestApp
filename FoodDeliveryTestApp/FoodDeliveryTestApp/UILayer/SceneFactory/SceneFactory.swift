//
//  SceneFactory.swift
//  FoodDeliveryTestApp
//
//  Created by Roman on 02/05/2024.
//

import UIKit

struct SceneFactory {
    // MARK: - Onboarding
    
    static func makeOnboardingFlow(coordinator: AppCoordinator, finishDelegate: CoordinatorFinishDelegate, navigationController: UINavigationController) {
        let onboardingCoordinator = OnboardingCoordinator(type: .onBoarding, navigationController: navigationController, finishDelegate: finishDelegate)
        coordinator.addChildCoordinator(onboardingCoordinator)
        onboardingCoordinator.start()
    }
    static func makeOnboardingCsene(coordinator: OnboardingCoordinator) -> OnboardingViewController {
        
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
        let presenter = OnboardingViewPresenter(coordinator: coordinator)
        let viewController = OnboardingViewController(pages: pages, viewOutput: presenter)
        
        return viewController
    }
    
    //MARK: - main flow
    
    static func makeMainFlow(coordinator: AppCoordinator, finishDelegate: CoordinatorFinishDelegate) -> TabBarController {
        
        let homeNavigationController = UINavigationController()
        let homeCoordinator = HomeCoordinator(type: .home, navigationController: homeNavigationController)
        homeNavigationController.tabBarItem = UITabBarItem(title: "Home", image: UIImage.init(systemName: "house.circle"), tag: 0)
        homeCoordinator.finishDelegate = finishDelegate
        homeCoordinator.start()
        
        let orderNavigationController = UINavigationController()
        let orderCoordinator = OrderCoordinator(type: .order, navigationController: orderNavigationController)
        orderNavigationController.tabBarItem = UITabBarItem(title: "Order", image: UIImage.init(systemName: "bag.circle"), tag: 1)
        orderCoordinator.finishDelegate = finishDelegate
        orderCoordinator.start()
        
        let listNavigationController = UINavigationController()
        let listCoordinator = ListCoordinator(type: .list, navigationController: listNavigationController)
        listNavigationController.tabBarItem = UITabBarItem(title: "List", image: UIImage.init(systemName: "list.bullet.circle"), tag: 2)
        listCoordinator.finishDelegate = finishDelegate
        listCoordinator.start()
        
        let profileNavigationController = UINavigationController()
        let profileCoordinator = ProfileCoordinator(type: .profile, navigationController: profileNavigationController)
        profileNavigationController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage.init(systemName: "person.crop.circle"), tag: 3)
        profileCoordinator.finishDelegate = finishDelegate
        profileCoordinator.start()
        
        coordinator.addChildCoordinator(homeCoordinator)
        coordinator.addChildCoordinator(orderCoordinator)
        coordinator.addChildCoordinator(listCoordinator)
        coordinator.addChildCoordinator(profileCoordinator)
        
        let tabBarControllers = [homeNavigationController, orderNavigationController, listNavigationController, profileNavigationController]
        let tabBarControler = TabBarController(tabBarControllers: tabBarControllers)
        return tabBarControler
    }
    
}
