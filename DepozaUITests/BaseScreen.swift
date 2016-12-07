//
//  BaseScreen.swift
//  Depoza
//
//  Created by Igor Dorovskikh on 9/23/16.
//  Copyright © 2016 Ivan Magda. All rights reserved.
//

import XCTest

class BaseScreen {
    
    static let app = XCUIApplication()
    static let table = XCUIApplication().tables
    
    func tablesQuery() -> XCUIElementQuery{
        return BaseScreen.table
    }

    
    func tap(element: XCUIElement){
        element.tap()
    }
    
    func doubleTap(element: XCUIElement){
        element.doubleTap()
    }
    
    func type(string : String, field : XCUIElement){
        tap(element: field)
        field.typeText(string)
        
    }
    
    func typeAfterSelectAll(string : String, field : XCUIElement){
        doubleTap(element: field)
        field.typeText(string)
    }
    

}
