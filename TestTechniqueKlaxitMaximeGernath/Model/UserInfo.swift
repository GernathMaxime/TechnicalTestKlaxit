//
//  UserInfo.swift
//  TestTechniqueKlaxitMaximeGernath
//
//  Created by Maxime Gernath on 15/01/2022.
//

import Foundation

struct UserInfo: Codable {
    let picture_url: String
    let first_name: String
    let last_name: String
    var phone_number: String
    var company: String
    var job_position: String
    var adress: String?
    
    func encoded() -> String {
        let encoder = JSONEncoder()
        let userData = try! encoder.encode(self)
        return String(data: userData, encoding: .utf8)!
    }
    
    static func decode(_ userInfoString: String) -> UserInfo {
        let decoder = JSONDecoder()
        let jsonData = userInfoString.data(using: .utf8)
        return try! decoder.decode((UserInfo.self), from: jsonData!)
    }
}
