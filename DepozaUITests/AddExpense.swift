//
//  AddExpense.swift
//  Depoza
//
//  Created by Igor Dorovskikh on 9/26/16.
//  Copyright © 2016 Ivan Magda. All rights reserved.
//

import XCTest

class AddExpense : BaseScreen {
    private let enterAmountField = table.textFields["enter_amount"]
    private let eatingOutCategory = table.staticTexts["EatingOut"]
    private let descriptionField = table.textFields["enter_description"]
    private let doneButton =  app.navigationBars["Add Expense"].buttons["Done"]
    
    override init(){
      enterAmountField.waitToExist()
    }
    
    func typeAmount(amount : String){
        type(string: amount, field: enterAmountField )
    }
    
    func selecEatingOutCategory(){
        tap(element: eatingOutCategory)
    }
    
    func typeExpesneDescription(description : String){
        if descriptionField.exists {
            type(string: description, field:descriptionField)
        }
    }
    
    func tapOnDoneButton(){
        tap(element: doneButton)
    }
}

