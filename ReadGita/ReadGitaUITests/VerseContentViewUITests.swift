//
//  VerseContentViewUITests.swift
//  ReadGitaUITests
//
//  Created by Pallavi Sharma on 17/10/23.
//

import XCTest

final class VerseContentViewUITests: XCTestCase {

    var app: XCUIApplication!

    override func setUp(){
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
    }

    override func tearDown() {
        app = nil
        super.tearDown()
    }

    func testContentViewUI() {
        app.launch()
        app.buttons[Constant.startNew].tap()
        app.buttons[Constant.verses].tap()
        let scrollViewExists = NSPredicate(format: "exists == true")
        let scrollViewExpectation = expectation(for: scrollViewExists, evaluatedWith: app.scrollViews["verseList"], handler: nil)

        // Wait for the expectation to be fulfilled or time out
        wait(for: [scrollViewExpectation], timeout: 10)
        let linkToTap = app.scrollViews["verseList"].images[Constant.rightArrow].firstMatch
        linkToTap.tap()
        let bg = app.scrollViews["verseContentScrollView"].staticTexts["\(Constant.BG) 1.1"]
        XCTAssertTrue(bg.exists)
    }
}
