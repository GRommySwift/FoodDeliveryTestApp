//
//  AppCoordinator.swift
//  FoodDeliveryTestApp
//
//  Created by Roman on 01/05/2024.
//

import UIKit

class AppCoordinator: Coordinator {
    
    private let userStorage = UserStorage.shared
    private let factory = SceneFactory.self
    
    override func start() {
        if userStorage.passedOnboarding {
            showAutFlow()
        } else {
           showOnboardingFlow()
        }
    }
    
    override func finish() {
        print("AppCoordinator finished")
    }

}

//MARK: Navigation methods

private extension AppCoordinator {
    
    func showOnboardingFlow() {
        guard let navigationController = navigationController else { return }
        factory.makeOnboardingFlow(coordinator: self, finishDelegate: self, navigationController: navigationController)
    }
    
    func showMainFlow() {
        guard let navigationController = navigationController else { return }
        let tabBarControler = factory.makeMainFlow(coordinator: self, finishDelegate: self)
        navigationController.pushViewController(tabBarControler, animated: true)
    }
    
    func showAutFlow() {
        guard let navigationController = navigationController else { return }
        let vc = factory.makeAuthScene(coordinator: self)
        navigationController.pushViewController(vc, animated: true)
    }
}

    // MARK: - Methods

extension AppCoordinator {
    func showSignInFlow() {
        guard let navigationController = navigationController else { return }
        let vc = factory.makeSignInScene(coordinator: self)
        navigationController.pushViewController(vc, animated: true)
    }
    func showSignUpFlow() {
        guard let navigationController = navigationController else { return }
        let vc = factory.makeSignUpScene(coordinator: self)
        navigationController.pushViewController(vc, animated: true)
    }
}

extension AppCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinish(childCoordinator: CoordinatorProtocol) {
        removeChildCoordinator(childCoordinator)
        switch childCoordinator.type {
        case .onBoarding:
            navigationController?.viewControllers.removeAll()
            showAutFlow()
        case .app:
            return
        default:
            navigationController?.popViewController(animated: false)
        }
    }
    
    
    
}
