//
//  HolidayPlanningViewModel.swift
//  HolidayPlanning
//
//  Created by Saurav Mishra on 26/10/19.
//  Copyright © 2019 Saurav Mishra. All rights reserved.
//

import Foundation
protocol HolidayPlanningViewModelRules {
    var url: String { get }
    var dic: Dictionary<String,String> { get }
    var model: Decodable.Type { get  }
    var componentScheme: String { get  }
    var componenthost: String { get }
    var appendcomponent: String { get  }
    var userEntry: String { get  }
    var token: String? { get  }
    var value: String? { get  }
    
}
class HolidayPlanningViewModel: HolidayPlanningViewModelRules {
    
    var url: String {
        return "https://od-api.oxforddictionaries.com/api/v2/entries/en-gb/example"    }
    
    var dic: Dictionary<String, String> {
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
