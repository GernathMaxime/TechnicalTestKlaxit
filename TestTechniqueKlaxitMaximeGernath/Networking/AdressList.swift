//
//  AdressList.swift
//  TestTechniqueKlaxitMaximeGernath
//
//  Created by Maxime Gernath on 15/01/2022.
//

import Foundation

struct AdressList: Decodable {
  let adresses: [Adress]
  
  enum CodingKeys: String, CodingKey {
    case adresses = "features"
  }
}

struct Adress: Decodable {
    let adress_details: AdressDetails
    
    enum CodingKeys: String, CodingKey {
      case adress_details = "properties"
    }
}

struct AdressDetails: Decodable {
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case name = "label"
    }
}
