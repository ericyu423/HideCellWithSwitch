//
//  aHiddenStaticCellUITests.swift
//  aHiddenStaticCellUITests
//
//  Created by eric yu on 11/7/17.
//  Copyright © 2017 eric yu. All rights reserved.
//

import XCTest

class aHiddenStaticCellUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
 
        let tablesQuery = XCUIApplication().tables
        let autoSyncSwitch = tablesQuery/*@START_MENU_TOKEN@*/.switches["Auto Sync"]/*[[".cells.switches[\"Auto Sync\"]",".switches[\"Auto Sync\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        autoSyncSwitch.tap()
        autoSyncSwitch.tap()
        
        let textField = tablesQuery.cells.containing(.staticText, identifier:"fowardground").children(matching: .textField).element
       
        let field = textField
        field.tap()
        
        XCTAssertEqual(field.value as! String, "")
        textField.typeText("asdf")
        
        XCTAssertEqual(field.value as! String, "asdf")
        
        let textField2 = tablesQuery.cells.containing(.staticText, identifier:"background").children(matching: .textField).element
        textField2.tap()
        textField2.tap()
        textField2.typeText("bvde")
   
    }
    
    func testExample2(){

        let tablesQuery = XCUIApplication().tables
        let textField = tablesQuery.cells.containing(.staticText, identifier:"fowardground").children(matching: .textField).element
        textField.tap()
        textField.typeText("a")
        let textField1 = tablesQuery.cells.containing(.staticText, identifier:"fowardground")
        XCTAssertNotEqual(textField1, nil)
        let autoSyncSwitch = tablesQuery/*@START_MENU_TOKEN@*/.cells.switches["Auto Sync"]/*[[".cells.switches[\"Auto Sync\"]",".switches[\"Auto Sync\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/
         XCTAssertEqual(autoSyncSwitch.value as! String ,"1")
        autoSyncSwitch.tap()
        XCTAssertEqual(autoSyncSwitch.value as! String , "0")
 
    }
    
}
