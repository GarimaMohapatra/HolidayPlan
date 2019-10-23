//
//  PostnetworkLayer.swift
//  HolidayPlanning
//
//  Created by Saurav Mishra on 21/10/19.
//  Copyright © 2019 Saurav Mishra. All rights reserved.
//

import Foundation
class CreateDictionary {
    func postServiceRequest<T: Decodable>(url: String, dic:Dictionary<String,String>, model: T.Type,componentScheme: String,componenthost: String,appendcomponent: String,userEntry:String, token: String?,value:String?) {
        var component = URLComponents()
        component.scheme? = componentScheme
        component.host = componenthost
        if let unwrappedToken = token {
            let queryItemToken =
                URLQueryItem(name: unwrappedToken, value: value)
            let queryItemQuery = URLQueryItem(name: unwrappedToken, value: value)
            component.queryItems = [queryItemToken, queryItemQuery]
        }
        
       // let get = URL(string: "\(component.url!)")!.appendingPathComponent(appendcomponent)
       // print(get)
        let urlString = url
        
        let geturl = URL(string: urlString)!
        var request = URLRequest(url: geturl)
        request.allHTTPHeaderFields = dic
        request.httpMethod = "GET"
        let session = URLSession.shared
        
        
        let task = session.dataTask(with: request) { (data, response, error) in
            guard let data = data, let _ = response,error == nil else {
                return
            }
            do {
                let model = try JSONDecoder().decode(model, from: data)
                let decodedData = model as! oxfordDictonary
                print(decodedData.results[0].lexicalEntries[0].entries[0].senses[0].examples![0].text)
                 
                
            } catch {
                print("Unexpected error: \(error).")
            }
            
        }
        task.resume()
    }
    
}

