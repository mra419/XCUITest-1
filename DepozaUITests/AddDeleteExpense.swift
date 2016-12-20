//
//  DepozaUITests.swift
//  DepozaUITests
//
//  Created by Igor Dorovskikh on 11/28/16.
//  Copyright © 2016 Ivan Magda. All rights reserved.
//

import XCTest

class DepozaUITests: BaseTest {

    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    
    func testDeleteExpense(){
        addingNewExpense()
        
        let summary = ExpenseSummary()
        summary.tapOnExpenseCell(index: 0)
        let expenseDetails = ExpenseDetails()
        expenseDetails.tapOnTrashButton()
        expenseDetails.tapOnDeleteButton()
        summary.visible()
        let totalExpense = summary.totalExpenseAmount()
        
        XCTAssert(totalExpense == "0", "Toral amount is \(totalExpense)")
        
        let expenseSummaryTable = summary.tablesQuery()
        waitForElementToAppear(format: "self.count = 1", element: expenseSummaryTable, time: 3.0)
        
        XCTAssertEqual(expenseSummaryTable.cells.count, 0 , "found instead: \(expenseSummaryTable.cells.debugDescription)")
        
    }
    
}
