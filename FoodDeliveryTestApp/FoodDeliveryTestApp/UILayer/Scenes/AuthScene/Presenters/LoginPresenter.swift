//
//  LoginViewPresenter.swift
//  FoodDeliveryTestApp
//
//  Created by Roman on 07/05/2024.
//

import Foundation

protocol LoginViewOutput: AnyObject {
    func loginStart()
    func startRegistration()
    func goToFacebookLogin()
    func goToGoogleLogin()
    func goToSignIn()
    func goToSignUp()
    func goToForhotPass()
    func back()
}

class LoginPresenter {
    
    private var coordinator: AppCoordinator?
    weak var viewInput: LoginViewInput?
    
    init(coordinator: AppCoordinator! = nil, viewInput: LoginViewInput? = nil) {
        self.coordinator = coordinator
        self.viewInput = viewInput
    }
    
}

extension LoginPresenter: LoginViewOutput {
    func loginStart() {
        
    }
    
    func startRegistration() {
        
    }
    
    func goToFacebookLogin() {
        
    }
    
    func goToGoogleLogin() {
        
    }
    
    func goToSignIn() {
        
    }
    
    func goToSignUp() {
        
    }
    
    func goToForhotPass() {
        
    }
    
    func back() {
        
    }
    
    
}
