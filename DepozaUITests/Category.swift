//
//  AddCategory.swift
//  Depoza
//
//  Created by Anton Kramarenko on 18/12/2016.
//  Copyright © 2016 Ivan Magda. All rights reserved.
//

class Category : BaseScreen {
    private let addCategory = table.staticTexts["Add category"]
    private let categories = table.staticTexts["Categories"]
    private let categoryNameField = table.textFields["CategoryName"]
    private let doneButton = app.navigationBars["Add Category"].buttons["Done"]
    private let editButton = app.navigationBars["Categories"].buttons["Edit"]
    private let addIcon = table.staticTexts["Icon"]
    private let qaCategoryRemove = table.staticTexts["QA"]
    
    override init(){
        super.init()
        visible()
        addCategory.waitToExist()
    }
    
    func visible(){
        print ("Categories is visible")
        categories.waitToExist()        
    }
    
    func typeCategoryName(amount : String){
        type(string: amount, field: categoryNameField )
    }
    
    func tapOnDoneButton(){
        tap(element: doneButton)
    }
    
    func tapOnEditButton(){
        tap(element: editButton)
    }
    
    func swipeLeftQaCategory(){                //swipe left
        swipeLeft(element: qaCategoryRemove)
    }
    
    func tapOnAddCategory() {
        tap(element: addCategory)
    }
    
    func forcetapOnCategories(){               //force tap
        categories.forceTapElement()
    }
    
    func tapOnCategories() {
        tap(element: categories)
    }
    
    func tapOnIcon(){
        tap(element: addIcon)
    }
    
    func removeQaCategory(){
        
    }

}
