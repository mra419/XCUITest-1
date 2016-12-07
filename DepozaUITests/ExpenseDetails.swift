//
//  ExpenseScreen.swift
//  Depoza
//
//  Created by Igor Dorovskikh on 9/26/16.
//  Copyright © 2016 Ivan Magda. All rights reserved.
//

import XCTest

class ExpenseDetails: BaseScreen {
    
    private let trashButton = app.navigationBars["Expense"].buttons["Trash"]
    private let editButton = app.navigationBars["Expense"].buttons["Edit"]
    private let doneButton = app.navigationBars["Expense"].buttons["Done"]
    private let deleteButton = app.alerts["Delete transaction?"].buttons["Delete"]
    private let expenseAmount = table.cells.element(boundBy: 0)
    
    
    override init() {
       trashButton.waitToExist()
    }
    
    
    func tapOnTrashButton(){
        tap(element: trashButton)
    }
    
    func tapOnDeleteButton() -> AnyObject {
        tap(element: deleteButton)
        return ExpenseSummary()
    }
    
    func tapOnEditButton(){
        tap(element: editButton)
    }
    
    
    func tapOnDoneButton() -> AnyObject {
        tap(element: doneButton)
        return ExpenseSummary()
    }
    
    func typeIntoAmount(amount: String) {
        typeAfterSelectAll(string: amount, field: expenseAmount)
    }
    
}
