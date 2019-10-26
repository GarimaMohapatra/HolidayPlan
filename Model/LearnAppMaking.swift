//
//  LearnAppMaking.swift
//  HolidayPlanning
//
//  Created by Saurav Mishra on 19/10/19.
//  Copyright © 2019 Saurav Mishra. All rights reserved.
//

import Foundation

struct LearnAppMakingInfo: Decodable {
    let firstName: String
    let lastName: String
    let age: Int

    enum Keys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
    }
}

extension LearnAppMakingInfo {
    init() {
        self.firstName = "Saurav"
        self.lastName = "Mishra"
        self.age = 31
    }
}
