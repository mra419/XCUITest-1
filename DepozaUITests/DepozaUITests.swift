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
    let tablesQuery = XCUIApplication().tables

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app.launchArguments = ["isUITesting"]
        app.launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testAddingNewExpense() {
        app.buttons["add_button"].tap()
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
    
    func testDeleteExpense(){
        testAddingNewExpense()
        
        let expense_cell = tablesQuery.cells["cell_0"].staticTexts["Fine Dinnig"]
        waitForElementToAppear(format: "isHittable == true", element: expense_cell, time: 3.0)
        expense_cell.tap()
       
        let trashButton = app.navigationBars["Expense"].buttons["Trash"]
        trashButton.tap()
        
        app.alerts["Delete transaction?"].buttons["Delete"].tap()
        
        let actual = tablesQuery.staticTexts["total_expenses_amount"].label
       
        XCTAssert(actual == "0", "Total amount is \(actual)")
        
        waitForElementToAppear(format: "self.count = 1", element: tablesQuery, time: 3.0)
        
        XCTAssertEqual(tablesQuery.cells.count, 0 , "found instead: \(tablesQuery.cells.debugDescription)")
    }
    
    func waitForElementToAppear(format: String, element: AnyObject, time: Double){
        let exists = NSPredicate(format: format)
        expectation(for: exists, evaluatedWith:element, handler: nil)
        waitForExpectations(timeout: time, handler: nil)
    }
    
}
