//
//  BayutTableViewTesting.swift
//  BayutTests
//
//  Created by Pande, Gaurav on 20/02/21.
//

import XCTest
@testable import Bayut

class BayutTableViewTesting: XCTestCase {

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
    
    func testHasATableView() {
            XCTAssertNotNil(viewControllerUnderTest.bayutStuffTableView)
        }
        
        func testTableViewHasDelegate() {
            XCTAssertNotNil(viewControllerUnderTest.bayutStuffTableView.delegate)
        }
        
        func testTableViewConfromsToTableViewDelegateProtocol() {
            XCTAssertTrue(viewControllerUnderTest.conforms(to: UITableViewDelegate.self))
            XCTAssertTrue(viewControllerUnderTest.responds(to: #selector(viewControllerUnderTest.tableView(_:didSelectRowAt:))))
        }

}
