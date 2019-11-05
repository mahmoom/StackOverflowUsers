//
//  UsersViewModel.swift
//  PIVStackOverflowTest
//
//  Created by Suhaib Mahmood on 11/5/19.
//  Copyright © 2019 test. All rights reserved.
//

import Foundation

struct UsersViewModel{
    var userName: String!
    var bronzeBadgeCount: String!
    var silverBadgeCount: String!
    var goldBadgeCount: String!
    
    init(user: User) {
        self.userName = user.userName ?? ""
        if let bronzeCount = user.badgeCount?.bronze{
            self.bronzeBadgeCount = "Bronze: " + String(bronzeCount)
        } else{
            self.bronzeBadgeCount = "Bronze:"
        }
        if let silverCount = user.badgeCount?.silver{
            self.silverBadgeCount = "Silver: " + String(silverCount)
        } else{
            self.silverBadgeCount = "Silver:"
        }
        if let goldCount = user.badgeCount?.gold{
            self.goldBadgeCount = "Gold: " + String(goldCount)
        } else{
            self.goldBadgeCount = "Gold:"
        }
    }
}
