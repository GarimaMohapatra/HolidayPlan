//
//  LearnAppMaking.swift
//  HolidayPlanning
//
//  Created by Saurav Mishra on 19/10/19.
//  Copyright © 2019 Saurav Mishra. All rights reserved.
//

import Foundation

struct LearnAppMakingInfo: Decodable {
    let first_name: String
    let last_name: String
    let age: Int
}

extension LearnAppMakingInfo {
    init() {
        self.first_name = "Saurav"
        self.last_name = "Mishra"
        self.age = 31
    }
}

