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
    
    func testAddingNewExpense() {
        let summary = ExpenseSummary()
        summary.tapOnAddExpenseButton()
        let addExpense = AddExpense()
        addExpense.typeAmount(amount: "100")
        addExpense.selecEatingOutCategory()
        addExpense.typeExpesneDescription(description: "Fine Dinning")
        addExpense.tapOnDoneButton()
        
        let totalExpense = summary.totalExpenseAmount()
        
        XCTAssert(totalExpense == "100", "Toral amount is \(totalExpense)")
        
    }
    
    func testDeleteExpense(){
        testAddingNewExpense()
        
        var summary = ExpenseSummary()
        summary.tapOnExpenseCell(index: 0)
        let expenseDetails = ExpenseDetails()
        expenseDetails.tapOnTrashButton()
        summary = expenseDetails.tapOnDeleteButton() as! ExpenseSummary
        let totalExpense = summary.totalExpenseAmount()
        
        XCTAssert(totalExpense == "0", "Toral amount is \(totalExpense)")
        
        let expenseSummaryTable = summary.tablesQuery()
        waitForElementToAppear(format: "self.count = 1", element: expenseSummaryTable, time: 3.0)
        
        XCTAssertEqual(expenseSummaryTable.cells.count, 0 , "found instead: \(expenseSummaryTable.cells.debugDescription)")
        
    }
    
    func testEditExpenseAmount(){
        testAddingNewExpense()
        
        var summary = ExpenseSummary()
        summary.tapOnExpenseCell(index: 0)
        let expenseDetails = ExpenseDetails()
        expenseDetails.tapOnEditButton()
        expenseDetails.typeIntoAmount(amount: "200")
        summary = expenseDetails.tapOnDoneButton() as! ExpenseSummary
        
        
        let totalExpense = summary.totalExpenseAmount()
        XCTAssert(totalExpense == "200", "actual total amount \(totalExpense)")
    
    }
    
}
