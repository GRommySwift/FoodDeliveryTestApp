//
//  UserStorage.swift
//  FoodDeliveryTestApp
//
//  Created by Roman on 02/05/2024.
//

import UIKit

class UserStorage {
    
    static let shared = UserStorage()
    
    var passedOnboarding: Bool {
        get { UserDefaults.standard.bool(forKey: "passedOnboarding")}
        set { UserDefaults.standard.set(newValue, forKey: "passedOnboarding")}
    }
    
}
