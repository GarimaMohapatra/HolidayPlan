//
//  NetworkLayer.swift
//  HolidayPlanning
//
//  Created by Saurav Mishra on 19/10/19.
//  Copyright © 2019 Saurav Mishra. All rights reserved.
//

import Foundation
class AppMaking {
func serviceRequest<T: Decodable>(url: String, modelType: T.Type) {
    guard let url =  URL(string: "https://learnappmaking.com/ex/users.json") else {
        print("Bad URL")
        return
    }

    let session = URLSession.shared.dataTask(with: url) { (data, _, error) in
        guard let data = data, error == nil else {
            return
        }
        let model = try? JSONDecoder().decode(modelType, from: data)
        print(model ?? "Error in Decoding")
    }

    session.resume()
}

}
