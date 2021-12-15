//
//  APIFunctions.swift
//  avy-log
//
//  Created by Adam Rosenberg on 12/14/21.
//

import Foundation
import Alamofire

struct Log: Decodable {
    var title: String
    var date: String
    var _id: String
    var log: String
}

class APIFunctions {
    
    var delegate: DataDelegate?

    static let functions = APIFunctions()
    
    func fetchLogs() {
        AF.request("http://192.168.86.176:3000/fetch").response{ response in
            let data = String(data: response.data!, encoding: .utf8)
            print("response ", response.data!)
            self.delegate?.updateArray(newArray: data!)
        } 
    }
    
    func addLog(date: String, title: String, log: String) {
        AF.request("http://192.168.86.176:3000/create", method: .post, encoding: URLEncoding.httpBody, headers: ["title": title, "log": log, "date": date])
            .responseJSON {
                response in
            }
    }
}