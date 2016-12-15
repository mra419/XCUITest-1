//
//  BaseTest.swift
//  Depoza
//
//  Created by Igor Dorovskikh on 12/6/16.
//  Copyright © 2016 Ivan Magda. All rights reserved.
//


import XCTest

class BaseTest : XCTestCase {
    
    let app = XCUIApplication()
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app.launchArguments = ["isUITesting"]
        app.launch()
        
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func waitForElementToAppear(format: String, element: AnyObject, time: Double){
        let exists = NSPredicate(format: format)
        expectation(for: exists, evaluatedWith:element, handler: nil)
        waitForExpectations(timeout: time, handler: nil)        
    }

    func addingNewExpense() {
        let summary = ExpenseSummary()
        summary.tapOnAddExpenseButton()
        let addExpense = AddExpense()
        addExpense.typeAmount(amount: "100")
        addExpense.selecEatingOutCategory()
        addExpense.typeExpesneDescription(description: "Fine Dinning")
        addExpense.tapOnDoneButton()
        
        summary.visible()
        
        let totalExpense = summary.totalExpenseAmount()
        
        XCTAssert(totalExpense == "100", "Toral amount is \(totalExpense)")
    
    }
    
    func getDate(daysFromToday: Int) -> (day : String, month : String){
        var components = DateComponents()
        components.setValue(daysFromToday, for: .day)
        
        let today = NSDate()
        let futureDate = NSCalendar.current.date(byAdding: components, to: today as Date)
        let futureDay = NSCalendar.current.component(.day, from: futureDate!)
        let futureDayString = String(futureDay)
        let futureMonth = NSCalendar.current.component( .month, from: futureDate!)
        
        let dateFormat = DateFormatter()
        let futureMonthString = dateFormat.shortMonthSymbols[futureMonth as Int - 1]
        
        return(futureDayString, futureMonthString )
    }
    
}
