//
//  BayutStuffTableViewDataSource.swift
//  Bayut
//
//  Created by Pande, Gaurav on 19/02/21.
//

import Foundation

import UIKit

class BayutStuffTableViewDataSource<CELL : UITableViewCell,T> : NSObject, UITableViewDataSource,UITableViewDelegate {
    
    private var cellIdentifier : String!
    private var items : [T]!
    var configureCell : (CELL, T) -> () = {_,_ in }
    
    
    init(cellIdentifier : String, items : [T], configureCell : @escaping (CELL, T) -> ()) {
        self.cellIdentifier = cellIdentifier
        self.items =  items
        self.configureCell = configureCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
         let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CELL
        let item = self.items[indexPath.row]
        let chevron = UIImage(named: "rightArrow.png")
            cell.accessoryType = .disclosureIndicator
        cell.accessoryView = UIImageView(image: chevron!)
        self.configureCell(cell, item)
        return cell
    }
    
    
}
