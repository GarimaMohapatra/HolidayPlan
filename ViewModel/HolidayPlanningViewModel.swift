//
//  HolidayPlanningViewModel.swift
//  HolidayPlanning
//
//  Created by Saurav Mishra on 26/10/19.
//  Copyright © 2019 Saurav Mishra. All rights reserved.
//

import Foundation
protocol UrlConfiguring: AnyObject {
    var url: String { get }
    var dic: [String: String] { get }
}
protocol ResponseModeling {
    var model: Decodable.Type { get  }
}
protocol RequestModeling {
    var userEntry: String { get  }
}
protocol HeaderConfiguration {
    var componentScheme: String { get  }
    var componenthost: String { get }
    var appendcomponent: String { get  }
}
protocol KeyValueConfiguration {
    var token: String? { get  }
    var value: String? { get  }
}
typealias UrlConfigurable = UrlConfiguring & RequestModeling & RequestModeling & HeaderConfiguration & KeyValueConfiguration

class HolidayPlanningViewModel: UrlConfigurable {

    var url: String {
        return componentScheme + componenthost + appendcomponent + userEntry
    }

        var dic: [String: String] {
        return ["app_id": "ac5f4204", "app_key": "188096a142883e86eee4ef848845411c"]    }

    var model: Decodable.Type {
        return OxfordDictonary.self

    }

    var componentScheme: String {
        return "https"

    }

    var componenthost: String {
        return "od-api.oxforddictionaries.com"

    }

    var appendcomponent: String {
        "/api/v2/entries/en-gb"

    }

    var userEntry: String {
        return "/love"

    }

    var token: String? {
        return nil
    }

    var value: String? {
        return nil
    }

}
