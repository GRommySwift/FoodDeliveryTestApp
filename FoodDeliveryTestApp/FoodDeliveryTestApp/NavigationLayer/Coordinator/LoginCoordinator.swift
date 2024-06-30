//
//  LoginCoordinator.swift
//  FoodDeliveryTestApp
//
//  Created by Roman on 23/06/2024.
//

import UIKit

//MARK: - LoginCoordinator

class LoginCoordinator: Coordinator {
    
    //MARK: - Properties
    private let factory = SceneFactory.self
    //MARK: - Methods
    override func start() {
        showAuthScene()
    }
    
    override func finish() {
        print("LoadingCoordinator finish")
        finishDelegate?.coordinatorDidFinish(childCoordinator: self)
    }

}

//MARK: - Navigation
extension LoginCoordinator {
    func showAuthScene() {
        guard let navigationController = navigationController else { return }
        let vc = factory.makeAuthScene(coordinator: self)
        navigationController.pushViewController(vc, animated: true)
    }
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
