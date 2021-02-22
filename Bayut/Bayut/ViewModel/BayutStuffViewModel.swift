//
//  BayutStuffViewModel.swift
//  Bayut
//
//  Created by Pande, Gaurav on 19/02/21.
//

import Foundation

class BayutStuffViewModel : NSObject {
    
    private var apiService : APIService!
    private(set) var stuffData : MyData! {
        didSet {
            self.bindStuffViewModelToController()
        }
    }
    
    var bindStuffViewModelToController : (() -> ()) = {}
    
    override init() {
        super.init()
        self.apiService =  APIService()
        callFuncToGetEmpData()
    }
    
    func callFuncToGetEmpData() {
        self.apiService.apiToGetStuffData { (stuffData) in
            self.stuffData = stuffData
         }
    }
}
