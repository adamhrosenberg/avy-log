//
//  Data.swift
//  SlidePath
//
//  Created by Adam Rosenberg on 12/19/21.
//

import SwiftUI

struct Log: Decodable {
    var title: String
    var date: String
    var _id: String
    var log: String
}

class Api {
    func getLogs(completion: @escaping ([Log]) -> ()) {
        guard let url = URL(string: "http://192.168.86.176:3000/fetch") else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            let logs = try! JSONDecoder().decode([Log].self, from: data!)
            DispatchQueue.main.async {
                completion(logs)
            }
        }
        .resume()
        
    }
}
