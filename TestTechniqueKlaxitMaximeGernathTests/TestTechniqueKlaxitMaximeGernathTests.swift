//
//  TestTechniqueKlaxitMaximeGernathTests.swift
//  TestTechniqueKlaxitMaximeGernathTests
//
//  Created by Maxime Gernath on 16/01/2022.
//

import XCTest
@testable import TestTechniqueKlaxitMaximeGernath

class TestTechniqueKlaxitMaximeGernathTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInitUserInfo() throws {
        let userInfo = UserInfo(picture_url: "https://test.jpg", first_name: "Maxime", last_name: "Gernath", phone_number: "+33 6 98 02 58 00", company: "Epitech", job_position: "Etudiant")
        
        XCTAssertEqual("https://test.jpg", userInfo.picture_url)
        XCTAssertEqual("Maxime", userInfo.first_name)
        XCTAssertEqual("Gernath", userInfo.last_name)
        XCTAssertEqual("+33 6 98 02 58 00", userInfo.phone_number)
        XCTAssertEqual("Epitech", userInfo.company)
        XCTAssertEqual("Etudiant", userInfo.job_position)
    }
    
    func testInitUserInfoWithAdress() throws {
        let userInfo = UserInfo(picture_url: "https://test.jpg", first_name: "Maxime", last_name: "Gernath", phone_number: "+33 6 98 02 58 00", company: "Epitech", job_position: "Etudiant", adress: "Paris")
        
        XCTAssertEqual("Paris", userInfo.adress)
    }

    func testImportUserInfoFromJSON() throws {
        let userInfo : UserInfo = Bundle.main.decode("account.json")
        
        XCTAssertEqual("https://picsum.photos/id/473/200/200", userInfo.picture_url)
        XCTAssertEqual("Michel", userInfo.first_name)
        XCTAssertEqual("Lambert", userInfo.last_name)
        XCTAssertEqual("+33 6 12 34 56 78", userInfo.phone_number)
        XCTAssertEqual("Klaxit", userInfo.company)
        XCTAssertEqual("Développeur iOS", userInfo.job_position)
    }

}
