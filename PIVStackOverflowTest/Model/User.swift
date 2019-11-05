//
//  User.swift
//  PIVStackOverflowTest
//
//  Created by Suhaib Mahmood on 11/5/19.
//  Copyright © 2019 test. All rights reserved.
//

import Foundation

struct User{
    var userName: String?
    var badgeCount: BadgeCount?
    var profileImageUrl: String?
}

extension User: Codable{
    enum CodingKeys: String, CodingKey {
        case userName = "display_name"
        case profileImageUrl = "profile_image"
        case badgeCount = "badge_counts"
    }
}

struct Wrapper<T: Decodable>: Decodable {
    let items: [T]
}
