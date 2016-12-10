//
//  ExpensesScreen.swift
//  Depoza
//
//  Created by Igor Dorovskikh on 9/23/16.
//  Copyright © 2016 Ivan Magda. All rights reserved.
//

import XCTest

class ExpenseSummary: BaseScreen {
    private let addExpenseButton = app.buttons["add_button"]
    private let totalAmount = table.staticTexts["total_expenses_amount"]

    static var objectCount:Int = 0

    override init() {
       super.init()
       visit()
       ExpenseSummary.objectCount+=1
        print(ExpenseSummary.objectCount)
    }
    
    func visit(){
        print("visit has been called")
        addExpenseButton.waitToExist()
    }
    
    
    func tapOnAddExpenseButton(){
        tap(element: addExpenseButton)
    }
    
    func tapOnExpenseCell(index: Int){
        tap(element: XCUIApplication().tables.cells["cell_\(index)"])
    }
    
    func totalExpenseAmount() -> String {
        return totalAmount.label
    }
    
}
