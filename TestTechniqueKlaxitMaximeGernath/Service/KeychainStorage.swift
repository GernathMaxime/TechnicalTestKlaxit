//
//  KeychainStorage.swift
//  TestTechniqueKlaxitMaximeGernath
//
//  Created by Maxime Gernath on 15/01/2022.
//

import Foundation
import SwiftKeychainWrapper

enum KeychainStorage {
    static let key = "account"
    
    static func getUserInfo() -> UserInfo? {
        if let userInfoString = KeychainWrapper.standard.string(forKey: Self.key) {
            return UserInfo.decode(userInfoString)
        } else {
            return nil
        }
    }
    
    static func saveuserinfo(_ userinfo: UserInfo) -> Bool {
        if KeychainWrapper.standard.set(userinfo.encoded(), forKey: Self.key) {
            return true
        } else {
            return false
        }
    }
    
}
