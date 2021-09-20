//
//  EBuyBooksUITests.swift
//  EBuyBooksUITests
//
//  Created by Ramesh kumar penta on 03/12/20.
//

import XCTest

class EBuyBooksUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        
        let app = XCUIApplication()
        app.launch()
        app.buttons["SignIn"].tap()
        app.staticTexts[""].swipeUp(velocity: .slow)
        XCUIApplication().alerts["“EBuyBooks” Wants to Use “amazoncognito.com” to Sign In"].scrollViews.otherElements.buttons["Continue"].tap()
//        app.alerts["“EBuyBooks” Wants to Use “amazoncognito.com” to Sign In"].scrollViews.otherElements.buttons["Continue"].tap()

        app.tables.cells.element(boundBy: 1).swipeUp()
        
    }
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
    
    func testClickOnCartNavigatesToBookDetailScreen() {
                        
                                    
                        
      
    }
}
