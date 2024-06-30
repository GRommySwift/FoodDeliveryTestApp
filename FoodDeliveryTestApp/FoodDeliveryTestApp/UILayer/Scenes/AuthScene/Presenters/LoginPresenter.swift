//
//  LoginViewPresenter.swift
//  FoodDeliveryTestApp
//
//  Created by Roman on 07/05/2024.
//

import Foundation

protocol LoginViewOutput: AnyObject {
    func loginStart(login: String, password: String)
    func startRegistration()
    func goToFacebookLogin()
    func goToGoogleLogin()
    func goToSignIn()
    func goToSignUp()
    func goToForhotPass()
    func back()
}

class LoginPresenter {
    
    private var coordinator: LoginCoordinator?
    weak var viewInput: LoginViewInput?
    
    init(coordinator: LoginCoordinator! = nil, viewInput: LoginViewInput? = nil) {
        self.coordinator = coordinator
        self.viewInput = viewInput
    }
    
}
private extension LoginPresenter {
    func goToMainScreen() {
        coordinator?.finish()
    }
}

extension LoginPresenter: LoginViewOutput {
   
    func loginStart(login: String, password: String) {
        viewInput?.startLoader()
        DispatchQueue.global().asyncAfter(deadline: .now() + 2.0) {
            if login.lowercased() == "test@mail.com" && password == "1234" {
                DispatchQueue.main.async { [weak self] in
                    self?.viewInput?.stopLoader()
                    self?.goToMainScreen()
                }
            } else {
                DispatchQueue.main.async { [weak self] in
                    print("Wrong email or pass")
                    self?.viewInput?.stopLoader()
                }
            }
        }
    }
        
        func startRegistration() {
            
        }
        
        func goToFacebookLogin() {
            
        }
        
        func goToGoogleLogin() {
            
        }
        
        func goToSignIn() {
            coordinator?.showSignInFlow()
        }
        
        func goToSignUp() {
            coordinator?.showSignUpFlow()
        }
        
        func goToForhotPass() {
            
        }
        
        func back() {
            
        }
}
