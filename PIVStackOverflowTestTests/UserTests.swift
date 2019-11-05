//
//  UserTests.swift
//  price-testTests
//
//  Created by Suhaib Mahmood on 11/1/19.
//  Copyright © 2019 goodrx. All rights reserved.
//


import XCTest
@testable import PIVStackOverflowTest

class UserTests: XCTestCase {

    var user: User!
    override func setUp() {
        let badgeCount = BadgeCount(bronze: 10, silver: 43, gold: 323)
        user = User(userName: "Billy", badgeCount: badgeCount, profileImageUrl: "someUrl")
    }


    func testName(){
        XCTAssertEqual("Billy", user.userName, "Name should match")
    }
    
    func testUserModelEquality(){
        let badgeCount = BadgeCount(bronze: 10, silver: 43, gold: 323)
        let newUser = User(userName: "Billy", badgeCount: badgeCount, profileImageUrl: "someUrl")
        XCTAssertEqual(newUser, user)
    }
    
    func testUserInequalityBronzeBadge(){
       
        let newBadgeCount = BadgeCount(bronze: 100, silver: 43, gold: 323)
        let newUser = User(userName: "Billy", badgeCount: newBadgeCount, profileImageUrl: "someUrl")
        XCTAssertNotEqual(newUser, user)
    }

}
