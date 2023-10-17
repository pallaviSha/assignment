//
//  PageViewUITests.swift
//  ReadGitaUITests
//
//  Created by Pallavi Sharma on 17/10/23.
//

import XCTest

final class PageViewUITests: XCTestCase {

    var app: XCUIApplication!

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
    }

    override func tearDown() {
        app = nil
        super.tearDown()
    }

    func testPageViewUI() {
        app.launch()
        app.buttons[Constant.startNew].tap()
        let scrollViewExists = NSPredicate(format: "exists == true")
        let scrollViewExpectation = expectation(for: scrollViewExists, evaluatedWith: app.scrollViews["chapterContent"], handler: nil)

        // Wait for the expectation to be fulfilled or time out
        wait(for: [scrollViewExpectation], timeout: 10)
        let verses = app.staticTexts[Constant.verses]
        XCTAssertTrue(verses.exists)
        verses.tap()
        XCTAssertTrue(verses.exists)
    }
}
