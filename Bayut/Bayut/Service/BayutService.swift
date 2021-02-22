//
//  BayutService.swift
//  Bayut
//
//  Created by Pande, Gaurav on 19/02/21.
//

import Foundation


class APIService :  NSObject {
    
    public let sourcesURL = URL(string: "https://ey3f2y0nre.execute-api.us-east-1.amazonaws.com/default/dynamodb-writer")!
    
    func apiToGetStuffData(completion : @escaping (MyData) -> ()){
 
        URLSession.shared.dataTask(with: sourcesURL) { (results, urlResponse, error) in
            if let data = results {
                
                let jsonDecoder = JSONDecoder()
                
                let stuffData = try! jsonDecoder.decode(MyData.self, from: data)
            
                    completion(stuffData)
 
            }
            
        }.resume()
    }
    
}
