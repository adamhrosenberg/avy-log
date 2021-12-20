//
//  Data.swift
//  SlidePath
//
//  Created by Adam Rosenberg on 12/19/21.
//

import SwiftUI
import Alamofire

struct Log: Decodable {
    var title: String
    var date: String
    var _id: String
    var log: String
}

class Api {
    func getLogs2(completion: @escaping ([Log]) -> ()) {
        guard let url = URL(string: "http://192.168.86.176:3000/fetch") else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            let logs = try! JSONDecoder().decode([Log].self, from: data!)
            DispatchQueue.main.async {
                completion(logs)
            }
        }
        .resume()
        
    }

    func getLogs(completion: @escaping ([Log]) -> ()) {
        AF.request("http://192.168.86.176:3000/fetch").response{ response in
            let logs = try! JSONDecoder().decode([Log].self, from: response.data!)

            print("response ", response.data!)
            DispatchQueue.main.async {
                completion(logs)
            }
        }
    }
    
    func addLog(date: String, title: String, log: String) {
        AF.request("http://192.168.86.176:3000/create", method: .post, encoding: URLEncoding.httpBody, headers: ["title": title, "log": log, "date": date])
            .responseJSON {
                response in
                print(response)
            }
    }
    
}
