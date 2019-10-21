//
//  PostnetworkLayer.swift
//  HolidayPlanning
//
//  Created by Saurav Mishra on 21/10/19.
//  Copyright © 2019 Saurav Mishra. All rights reserved.
//

import Foundation
class CreateDictionary {
    func postServiceRequest<T: Decodable>(url: String,valueOfheader:String,keyOfheader:String,model: T.Type) {
let urlString = "https://od-api.oxforddictionaries.com/api/v2"
   let geturl = URL(string: urlString)
    var request = URLRequest(url: geturl!)
     request.setValue(valueOfheader, forHTTPHeaderField: keyOfheader)
request.httpMethod = "GET"
    let session = URLSession.shared
    let task = session.dataTask(with: (request as? URLRequest)!) { (data, response, error) in
        guard let data = data,let _ = response,error == nil else {
            return
    }
        guard let _ = try? JSONDecoder().decode(model, from: data) else {
            return
        }
       
        
    }
    task.resume()
}
    
}

