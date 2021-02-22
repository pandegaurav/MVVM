//
//  BayutUITests.swift
//  BayutUITests
//
//  Created by Pande, Gaurav on 21/02/21.
//

import XCTest

class BayutUITests: XCTestCase {

    var app: XCUIApplication!
    
    override func setUp() {
            super.setUp()
            continueAfterFailure = false
            app = XCUIApplication()
            app.launchArguments.append("--uitesting")
        }
    
    func testGoingThroughOnboarding() {
            app.launch()
        
        let isDisplayingOnboarding = app.otherElements["Onboarding View"].exists
         XCTAssertTrue(isDisplayingOnboarding)
 
        }
    
    
 
    func testSelectingStuff() {
            let app = XCUIApplication()
            app.launch()
            let cell = app.tables["Stuff-list"].cells.firstMatch
            XCTAssertTrue(cell.waitForExistence(timeout: 10))
            cell.tap()
            let nextScreenLabel = app
                .otherElements["Detail View"]
            XCTAssertTrue(nextScreenLabel.exists)
        }
}


