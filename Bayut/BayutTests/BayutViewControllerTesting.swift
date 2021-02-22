//
//  BayutViewControllerTesting.swift
//  BayutTests
//
//  Created by Pande, Gaurav on 20/02/21.
//

import XCTest

@testable import Bayut

class BayutViewControllerTesting: XCTestCase {
    
    var viewControllerUnderTest: BayutViewController!
    
    override func setUp() {
            super.setUp()
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            self.viewControllerUnderTest = storyboard.instantiateViewController(withIdentifier: "BayutViewController") as? BayutViewController
            self.viewControllerUnderTest.loadView()
            self.viewControllerUnderTest.viewDidLoad()
        }
    
    override func tearDown() {
            super.tearDown()
        }

    func testRender() {
        XCTAssertEqual(viewControllerUnderTest.navigationItem.title, "Stuff List")
    }
    
    

}
