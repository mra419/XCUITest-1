//
//  DepozaUITests.swift
//  DepozaUITests
//
//  Created by Igor Dorovskikh on 11/28/16.
//  Copyright © 2016 Ivan Magda. All rights reserved.
//

import XCTest

class DepozaUITests: XCTestCase {
    
    let app = XCUIApplication()

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app.launchArguments = ["isUITesting"]
        app.launch()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testAddingNewExpense() {
        
        app.buttons["add_button"].tap()
        
        let tablesQuery = app.tables
        tablesQuery.textFields["enter_amount"].tap()
        tablesQuery.textFields["enter_amount"].typeText("100")
        
        
        tablesQuery.staticTexts["EatingOut"].tap()
        
        let typeDescription = tablesQuery.textFields["enter_description"]
        typeDescription.tap()
        typeDescription.typeText("Fine Dinnig")
        
        app.navigationBars["Add Expense"].buttons["Done"].tap()
        
        
        let totalExpense = tablesQuery.staticTexts["total_expenses_amount"].label
        XCTAssert(totalExpense == "100", "actual total amount \(totalExpense)")
        
    }
    
}
