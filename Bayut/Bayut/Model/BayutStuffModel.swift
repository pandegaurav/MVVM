//
//  BayutStuffModel.swift
//  Bayut
//
//  Created by Pande, Gaurav on 19/02/21.
//

import Foundation


struct MyData: Decodable {
     let results: [StuffData]
     
}

struct StuffData: Decodable {
    let created, price, name,uid: String
    let imageID : [String]
    let imageURL:[String]
    let imagethumbUrL : [String]
    
    enum CodingKeys: String, CodingKey {
      
        case created    = "created_at"
        case price      = "price"
        case name       = "name"
        case uid        = "uid"
        case imageID    = "image_ids"
        case imageURL   = "image_urls"
        case imagethumbUrL = "image_urls_thumbnails"
  
    }
    
    
     
    
   


 
 


 
    
   
}
