//
//  EditExpense.swift
//  Depoza
//
//  Created by Igor Dorovskikh on 12/9/16.
//  Copyright © 2016 Ivan Magda. All rights reserved.
//

import XCTest


class EditExpense: BaseTest {
    
    override func setUp() {
        super.setUp()
        
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testEditExpenseAmount(){
        addingNewExpense()
        
        let summary = ExpenseSummary()
        summary.tapOnExpenseCell(index: 0)
        let expenseDetails = ExpenseDetails()
        expenseDetails.tapOnEditButton()
        expenseDetails.typeIntoAmount(amount: "200")
        expenseDetails.tapOnDoneButton()
        
        summary.visit()
        
        let totalExpense = summary.totalExpenseAmount()
        XCTAssert(totalExpense == "200", "actual total amount \(totalExpense)")
        
    }

    
    func testEditDate(){
        //setting future day and month
        let (day, month) = getFutureDate(daysFromToday: 20)
        print ("++++++++++++++Future day is \(day) and month is \(month)++++++++++++++++")
        
        addingNewExpense()
        
        let summary = ExpenseSummary()
        summary.tapOnExpenseCell(index: 0)
        let expenseDetails = ExpenseDetails()
        expenseDetails.tapOnEditButton()
        
        expenseDetails.tapOnDateCell()
        expenseDetails.selectDate(month: month, day: day)
        expenseDetails.tapOnDoneButton()
        
        
        XCTAssert(expenseDetails.getDateFromCell().contains("\(day) \(month)"), "found instead: \(expenseDetails.getDateFromCell())")
        
    }
}
