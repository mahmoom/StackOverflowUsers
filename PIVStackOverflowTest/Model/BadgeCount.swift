//
//  BadgeCount.swift
//  PIVStackOverflowTest
//
//  Created by Suhaib Mahmood on 11/5/19.
//  Copyright © 2019 test. All rights reserved.
//

import Foundation

struct BadgeCount: Codable{
    var bronze: Int?
    var silver: Int?
    var gold: Int?
}

extension BadgeCount: Equatable {
    static func == (lhs: BadgeCount, rhs: BadgeCount) -> Bool {
        return lhs.bronze == rhs.bronze && lhs.silver == rhs.silver && lhs.gold == rhs.gold 
    }
}
