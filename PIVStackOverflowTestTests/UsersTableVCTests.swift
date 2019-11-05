//
//  UsersTableVCTests.swift
//  price-testTests
//
//  Created by Suhaib Mahmood on 11/1/19.
//  Copyright © 2019 goodrx. All rights reserved.
//

import XCTest
@testable import PIVStackOverflowTest

class UsersTableVCTests: XCTestCase {

    var userTableVC: UsersTableVC!
    var mockNetwork: MockNetwork!
    
    override func setUp() {
        super.setUp()
        
        userTableVC = UsersTableVC()
        let _ = userTableVC.view
        userTableVC.users = [User]()
        
        
        for _ in 0..<20 {
            let badgeCount = BadgeCount(bronze: 10, silver: 43, gold: 323)
            let user = User(userName: "Billy", badgeCount: badgeCount, profileImageUrl: "someUrl")
            userTableVC.users?.append(user)
        }
    }
    
    override func tearDown() {
        userTableVC = nil
    }
    
    func testDataSourceHasUsers() {
        XCTAssertEqual(userTableVC.users?.count, 20,
                       "DataSource should have correct number of pharmacies")
    }
    

    func testHasOneSectionWhenUsersArePresent() {
        XCTAssertEqual(userTableVC.numberOfSections(in: userTableVC.tableView), 1,
                       "TableView should have one section when users are present")
    }

    func testNumberOfRows() {
        let numberOfRows = userTableVC.tableView(userTableVC.tableView, numberOfRowsInSection: 0)
        XCTAssertEqual(numberOfRows, 20,
                       "Number of rows in table should match number of users")
    }

    func testCellForRowPharmNameLabel() {
        let cell = userTableVC.tableView(userTableVC.tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as! UserTableViewCell
        XCTAssertEqual(cell.userNameLabel.text, "Billy")
    }
    
    func testFetchUsers(){
        let mockService = MockNetwork()
        userTableVC.performNetworkCall(networkManager: mockService)
        //users should be updated
        if let users = userTableVC.users {
            XCTAssertEqual(mockService.result, users)
        } else {
            XCTFail("Data Source should not be nil!!!")
        }
    }
    

    struct MockNetwork: NetworkManagerProtocol {
        var result = [User(userName: "Billy", badgeCount: BadgeCount(bronze: 10, silver: 43, gold: 323), profileImageUrl: "someUrl"), User(userName: "John", badgeCount: BadgeCount(bronze: 43, silver: 4, gold: 23), profileImageUrl: "anotherUrl")]
        
        func getStackOverflowUsers(completion: @escaping (Result<[User], DataResponseError>) -> ()) {
            completion(.success(result))
        }
    }
}
