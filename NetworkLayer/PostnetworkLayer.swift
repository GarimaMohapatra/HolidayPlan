//
//  PostnetworkLayer.swift
//  HolidayPlanning
//
//  Created by Saurav Mishra on 21/10/19.
//  Copyright © 2019 Saurav Mishra. All rights reserved.
//

import Foundation
class CreateDictionary {
    func postServiceRequest<T: Decodable>(parameters: Parameters<T>, completion: @escaping (_ data: T?, _ error: Error?) -> Void) {
        var component = URLComponents()
        component.scheme? = parameters.componentScheme
        component.host = parameters.componenthost
        if let unwrappedToken = parameters.token {
            let queryItemToken =
                URLQueryItem(name: unwrappedToken, value: parameters.value)
            let queryItemQuery = URLQueryItem(name: unwrappedToken, value: parameters.value)
            component.queryItems = [queryItemToken, queryItemQuery]
        }

        let urlString = parameters.url

        let geturl = URL(string: urlString)!
        var request = URLRequest(url: geturl)
        request.allHTTPHeaderFields = parameters.dic
        request.httpMethod = "GET"
        let session = URLSession.shared

        let task = session.dataTask(with: request) { (data, _, error) in
            guard let data = data, error == nil else {
                return
            }
            do {
                let model = try JSONDecoder().decode(parameters.model, from: data)
                guard let decodedData = model as? OxfordDictonary else { return }
                completion(model, nil)
                print(decodedData.results[0].lexicalEntries[0].entries[0].senses[0].examples![0].text)

            } catch {
                print("Unexpected error: \(error).")
                completion(nil, error)
            }

        }
        task.resume()
    }
}

struct Parameters<T: Decodable> {
   let url: String
    let dic: [String: String]
    let model: T.Type
    let componentScheme: String
    let componenthost: String
    let appendcomponent: String
    let userEntry: String
    let token: String?
    let value: String?

}
