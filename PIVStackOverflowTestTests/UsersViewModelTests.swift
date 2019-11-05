//
//  UsersViewModelTests.swift
//  price-testTests
//
//  Created by Suhaib Mahmood on 11/1/19.
//  Copyright © 2019 goodrx. All rights reserved.
//

import XCTest
@testable import PIVStackOverflowTest

class UsersViewModelTests: XCTestCase {

    var userViewModel: UsersViewModel!
    var user: User!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let badgeCount = BadgeCount(bronze: 10, silver: 43, gold: 323)
        user = User(userName: "Billy", badgeCount: badgeCount, profileImageUrl: "someUrl")
        userViewModel = UsersViewModel(user: user)
    }


    func testUserNameMatchesModel(){
        XCTAssertEqual("Billy", userViewModel.userName)
    }
    
    func testBronzeCountMatchesModel(){
        XCTAssertEqual("Bronze: 10", userViewModel.bronzeBadgeCount)
    }
    
    func testSilverCountMatchesModel(){
        XCTAssertEqual("Silver: 43", userViewModel.silverBadgeCount)
    }

    func testGoldCountMatchesModel(){
        XCTAssertEqual("Gold: 323", userViewModel.goldBadgeCount)
    }
    
    func testBronzeNilCountMatchesModel(){
        let badgeCount = BadgeCount(bronze: nil, silver: 10, gold: 10)
        user = User(userName: "Billy", badgeCount: badgeCount, profileImageUrl: "someUrl")
        userViewModel = UsersViewModel(user: user)
        XCTAssertEqual("Bronze:", userViewModel.bronzeBadgeCount)
    }
    
    func testSilverNilCountMatchesModel(){
        let badgeCount = BadgeCount(bronze: 10, silver: nil, gold: 10)
        user = User(userName: "Billy", badgeCount: badgeCount, profileImageUrl: "someUrl")
        userViewModel = UsersViewModel(user: user)
        XCTAssertEqual("Silver:", userViewModel.silverBadgeCount)
    }

    func testGoldNilCountMatchesModel(){
        let badgeCount = BadgeCount(bronze: 432, silver: 10, gold: nil)
        user = User(userName: "Billy", badgeCount: badgeCount, profileImageUrl: "someUrl")
        userViewModel = UsersViewModel(user: user)
        XCTAssertEqual("Gold:", userViewModel.goldBadgeCount)
    }
}
