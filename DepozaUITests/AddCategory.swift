//
//  AddCategory.swift
//  Depoza
//
//  Created by Anton Kramarenko on 18/12/2016.
//  Copyright © 2016 Ivan Magda. All rights reserved.
//

class AddCategory: BaseTest {
    
    override func setUp() {
        super.setUp()
        
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testAddCategory(){
        
        app.tabBars.buttons["More"].tap()
        
        let newcategory = Category()
        newcategory.tapOnAddCategory()
        newcategory.typeCategoryName(amount: "QA")
        newcategory.tapOnDoneButton()
    }
    
    func testDeleteCategory() { //that one doesn't work sometimes //
        testAddCategory()
    
        let newcategory = Category()
        newcategory.visible()
        newcategory.forcetapOnCategories() //I use forceTap function here
        newcategory.swipeLeftQaCategory()
    }
    
    func testDeleteCategory2() { //this is the original test I tried to use but it fails //
        testAddCategory()
        
        let newcategory = Category()
        newcategory.visible()
        newcategory.tapOnCategories() //it canno't tap on Categories
        newcategory.swipeLeftQaCategory()
        
    }
}

